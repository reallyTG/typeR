library(CytobankAPI)


### Name: flowsom
### Title: FlowSOM Endpoints
### Aliases: flowsom flowsom.copy_settings,UserSession,FlowSOM-method
###   flowsom.copy_settings flowsom.delete,UserSession,FlowSOM-method
###   flowsom.delete flowsom.download,UserSession,FlowSOM-method
###   flowsom.download flowsom.list,UserSession-method flowsom.list
###   flowsom.new,UserSession-method flowsom.new
###   flowsom.rename,UserSession,FlowSOM-method flowsom.rename
###   flowsom.run,UserSession,FlowSOM-method flowsom.run
###   flowsom.show,UserSession-method flowsom.show
###   flowsom.status,UserSession,FlowSOM-method flowsom.status
###   flowsom.update,UserSession,FlowSOM-method flowsom.update

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")

# cyto_flowsom refers to a FlowSOM object that is created from FlowSOM endpoints
#   examples: flowsom.new, flowsom.show (see details section for more)
## End(No test)
## No test: 
flowsom.copy_settings(cyto_session, flowsom=cyto_flowsom)
## End(No test)
## No test: 
flowsom.delete(cyto_session, flowsom=cyto_flowsom)
## End(No test)
## No test: 
# Download a FlowSOM analysis to the current working directory
flowsom.download(cyto_session, flowsom)

# Download a FlowSOM analysis to a new directory
flowsom.download(cyto_session, flowsom, directory="/my/new/download/directory/")
## End(No test)
## No test: 
# Dataframe of all FlowSOM advanced analyses with all fields present
flowsom.list(cyto_session, 22)

# Raw list of all FlowSOM advanced analyses with all fields present
flowsom.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
flowsom.new(cyto_session, 22, flowsom_name="My new FlowSOM analysis")
## End(No test)
## No test: 
flowsom.rename(cyto_session, flowsom=cyto_flowsom, flowsom_name="My updated FlowSOM name")
## End(No test)
## No test: 
flowsom.run(cyto_session, flowsom=cyto_flowsom)
## End(No test)
## No test: 
flowsom.show(cyto_session, 22, flowsom_id=2)
## End(No test)
## No test: 
flowsom.status(cyto_session, flowsom=cyto_flowsom)
## End(No test)
## No test: 
flowsom.update(cyto_session, flowsom=cyto_flowsom)
## End(No test)



