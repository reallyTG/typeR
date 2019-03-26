library(tibbrConnector)


### Name: tibbr.post
### Title: Post A Message To tibbr
### Aliases: tibbr.post

### ** Examples

## Not run: 
##D con <- tibbr.connect("try.tibbr.com", "myusername", "mypassword")
##D tibbr.post(con, "Hello, tibbr!")  # Posts to your wall
##D tibbr.post(con, "Hello, salesmen!", subject="Sales")
##D tibbr.post(con, "Hello, everyone.",
##D     subject=c("Sales", "Marketing", "Engineering.ProjectAlpha"))
##D tibbr.post(con, "Here's that proposal.", subject="Sales",
##D     links="http://sales/Alpha_Proposal/",
##D     attachments=c("AlphaCoverLetter.docx","AlphaProjections.csv"))
##D alpha <- tibbr.subject(con, "alpha")
##D tibbr.post(con, "To everyone involved in the Alpha project: Good job!", subject=alpha)
## End(Not run)



