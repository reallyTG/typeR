library(IMmailgun)


### Name: mailgun
### Title: mailgun factory
### Aliases: mailgun
### Keywords: datasets

### ** Examples

## Not run: 
##D library(IMmailgun)
##D url <- "https://api.mailgun.net/v3/email.ignacio.website"
##D key="~/.ssh/id_rsa"
##D api_key <- secret::get_secret("mailgun", key = key,
##D vault = file.path(system.file(package = "IMSecrets"),
##D "vault/"))[[1]]
##D from="IMSecrets <postmaster@email.ignacio.website>"
##D email_client <- mailgun$new(url = url, api_key = api_key, from = from)
##D email_client$sendEmail(to = c("ignacio82@gmail.com", "ignacio@protonmail.com"),
##D subject = "Test", plaintext = "Hola!")
## End(Not run)



