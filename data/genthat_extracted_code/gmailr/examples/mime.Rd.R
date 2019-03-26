library(gmailr)


### Name: mime
### Title: Create a mime formatted message object
### Aliases: attach_file attach_part bcc.mime cc.mime from.mime html_body
###   mime subject.mime text_body to.mime

### ** Examples

# using the field functions
msg = mime() %>%
 from("james.f.hester@gmail.com") %>%
 to("asdf@asdf.com") %>%
 text_body("Test Message")

# alternatively you can set the fields using mime(), however you have
#  to use properly formatted MIME names
msg = mime(From="james.f.hester@gmail.com",
                   To="asdf@asdf.com") %>%
        html_body("<b>Test<\b> Message")



