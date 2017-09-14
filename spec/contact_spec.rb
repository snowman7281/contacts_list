#!/usr/bin/env ruby

require 'pry'
require 'rspec'
require 'contact'

describe('ContactList::Contact') do
  it "stores a user's first name, last name, job title, company, and contact type" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    expect(bob.first_name).to(eq("Bob"))
    expect(bob.last_name).to(eq("Bobbington"))
    expect(bob.job_title).to(eq("Developer"))
    expect(bob.company).to(eq("Microsoft"))
    expect(bob.contact_type).to(eq("Professional"))
  end

  it "allows user to add phone numbers to a contact" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.add_phone("555-555-5555", "work")
    bob.add_phone("111-111-1111", "cell")
    expect(bob.phone).to(eq({"work" => "555-555-5555", "cell" => "111-111-1111"}))
  end

  it "allows user to add multiple email addresses" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.add_email("bob@email.com", "personal")
    bob.add_email("bob@workemail.com", "work")
    expect(bob.email).to(eq({"personal" => "bob@email.com", "work" => "bob@workemail.com"}))
  end

  it "allows user to add multiple addresses" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.add_address("1234 Redmond Way, Redmond, WA 99999", "home")
    bob.add_address("466 Microsoft Way, Redmond, WA 99999", "work")
    expect(bob.address).to(eq({"home" => "1234 Redmond Way, Redmond, WA 99999", "work" => "466 Microsoft Way, Redmond, WA 99999"}))
  end

  it "sets phone/address/email to default when not given a type" do
    bob = ContactList::Contact.new({:first_name => "Bob", :last_name => "Bobbington", :job_title => "Developer", :company => "Microsoft", :contact_type => "Professional"})
    bob.add_address("1234 Redmond Way, Redmond, WA 99999")
    expect(bob.address).to(eq({"default" => "1234 Redmond Way, Redmond, WA 99999"}))
  end
end
