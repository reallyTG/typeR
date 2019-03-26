library(docuSignr)


### Name: docu_envelope
### Title: Create document for particular instance to be signed
### Aliases: docu_envelope

### ** Examples

## Not run: 
##D # assuming env variables are properly set up
##D login <- docu_login()
##D template <- docu_templates(base_url = login[1, "baseUrl"])
##D (env <- docu_envelope(username = Sys.getenv("docuSign_username"),
##D  password = Sys.getenv("docuSign_password"),
##D  integrator_key = Sys.getenv("docuSign_integrator_key"),
##D  account_id = login[1, "accountId"], base_url = login[1, "baseUrl"],
##D  template_id = template$templateId,
##D  template_roles = list(name = "Name", email = "email@example.com",
##D                       roleName = "Role", clientUserId = "1"),
##D  email_subject = "Subject", email_blurb = "Body"
##D  ))
##D  
## End(Not run)



