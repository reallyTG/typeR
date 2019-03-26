library(rodham)


### Name: extract_emails
### Title: Extract emails contents
### Aliases: extract_emails

### ** Examples

## Not run: 
##D # download emails
##D download_emails("August") # August release
##D 
##D dir.create("emails_pdf") # dir to extract zip
##D 
##D unzip("August.zip", exdir = "./emails_pdf")
##D 
##D # create directory to store extracted contents
##D dir.create("emails_txt")
##D 
##D ext <- get_xpdf()
##D 
##D extarct_contents(emails = "HRC_Email_296", dest = "./emails_txt", extractor = ext)
## End(Not run)




