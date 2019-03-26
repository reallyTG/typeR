library(rvest)


### Name: submit_form
### Title: Submit a form back to the server.
### Aliases: submit_form

### ** Examples

test <- google_form("1M9B8DsYNFyDjpwSK6ur_bZf8Rv_04ma3rmaaBiveoUI")
f0 <- html_form(test)[[1]]
f1 <- set_values(f0, entry.564397473 = "abc")



