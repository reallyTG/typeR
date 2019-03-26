library(Rlinkedin)


### Name: getCompany
### Title: Retrieve Company Profile Information
### Aliases: getCompany

### ** Examples

## Not run: 
##D 
##D company.name <- getCompany(token=in.auth, universal_name="Facebook")
##D 
##D company.email <- getCompany(token=in.auth, email_domain = "columbia.edu")
##D 
##D # Main Columbia Name:
##D company.id <- getCompany(token=in.auth, company_id = company.email$company_id[14])
##D 
## End(Not run)



