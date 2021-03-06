require 'spec_helper'

describe Shipping::UPS do
  let(:target) { Shipping::UPS }

  it_behaves_like "shipping class" do
    let(:name) { 'UPS' }
  end

  describe "cost" do
    subject { target.new(25).cost }
    it("is $2 plus $1.50 per pound"){ should == 39.5 }
  end
  
  describe "days" do
    describe "when package is under 5 pounds" do
      subject { target.new(4.9).days }
      it { should == 2.0 }
    end
    
    describe "when package is more than 5 pounds" do
      subject { target.new(5).days }
      it { should == 6.0 }
    end
  end
end
