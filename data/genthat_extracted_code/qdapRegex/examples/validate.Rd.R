library(qdapRegex)


### Name: validate
### Title: Regex Validation Function Generator
### Aliases: validate

### ** Examples

## Single element email
valid_email <- validate("@rm_email")
valid_email(c("tyler.rinker@gmail.com", "@trinker"))

## Multiple elements
valid_email_1 <- validate("@rm_email", single=FALSE)
valid_email_1(c("tyler.rinker@gmail.com", "@trinker"))

## single element address
valid_address <- validate("@rm_city_state_zip")
valid_address("Buffalo, NY 14217")
valid_address("buffalo,NY14217")
valid_address("buffalo NY 14217")

valid_address2 <- validate(paste0("(\\b([A-Z][\\w-]*)+),", 
    "\\s([A-Z]{2})\\s(?<!\\d)\\d{5}(?:[ -]\\d{4})?\\b"))
valid_address2("Buffalo, NY 14217")
valid_address2("buffalo, NY 14217")
valid_address2("buffalo,NY14217")
valid_address2("buffalo NY 14217")    



