library(rodham)


### Name: load_emails
### Title: load emails from text files
### Aliases: load_emails

### ** Examples

## Not run: 
##D # get xpdf extractor
##D ext <- get_xpdf()
##D 
##D # create
##D dir.create("emails")
##D 
##D # get emails released in august
##D emails_aug <- get_emails(release = "August", save.dir = "./emails",
##D                      extractor = ext)
##D 
##D # use manually downloaded extractor
##D # ext <- "C:/xpdfbin-win-3.04/bin64/pdftotext.exe"
##D 
##D # get emails related to Benghazi released in December
##D emails_bengh <- get_emails(release = "Benghazi", extractor = ext,
##D                            save.dir = "./emails")
##D 
##D contents <- load_emails(emails_bengh)
## End(Not run)




