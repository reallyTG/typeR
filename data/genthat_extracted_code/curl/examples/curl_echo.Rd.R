library(curl)


### Name: curl_echo
### Title: Echo Service
### Aliases: curl_echo

### ** Examples

h <- handle_setform(new_handle(), foo = "blabla", bar = charToRaw("test"),
myfile = form_file(system.file("DESCRIPTION"), "text/description"))
formdata <- curl_echo(h)

# Show the multipart body
cat(rawToChar(formdata$body))

# Parse multipart
webutils::parse_http(formdata$body, formdata$content_type)



