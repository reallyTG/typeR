library(docuSignr)


### Name: docu_embedded_sign
### Title: Embedded docuSign
### Aliases: docu_embedded_sign docu_embedded_send

### ** Examples

## Not run: 
##D # assuming env variables are properly set up
##D login <- docu_login()
##D template <- docu_templates(base_url = login[1, "baseUrl"])
##D env <- docu_envelope(username = Sys.getenv("docuSign_username"),
##D  password = Sys.getenv("docuSign_password"),
##D  integrator_key = Sys.getenv("docuSign_integrator_key"),
##D  account_id = login[1, "accountId"], base_url = login[1, "baseUrl"],
##D  template_id = template$templateId,
##D  template_roles = list(name = "Name", email = "email@example.com",
##D                       roleName = "Role", clientUserId = "1"),
##D  email_subject = "Subject", email_blurb = "Body"
##D  )
##D URL <- docu_embed(
##D  base_url = login[1, "baseUrl"], return_url = "www.google.com",
##D  signer_name = "Name", signer_email = "email@example.com",
##D  client_user_id = "1",
##D  envelope_id = env$envelopeId
##D )
## End(Not run)



