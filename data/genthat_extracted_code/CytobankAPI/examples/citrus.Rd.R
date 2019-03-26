library(CytobankAPI)


### Name: citrus
### Title: CITRUS Endpoints
### Aliases: citrus citrus.copy_settings,UserSession,CITRUS-method
###   citrus.copy_settings citrus.delete,UserSession,CITRUS-method
###   citrus.delete citrus.download,UserSession,CITRUS-method
###   citrus.download citrus.list,UserSession-method citrus.list
###   citrus.new,UserSession-method citrus.new
###   citrus.rename,UserSession,CITRUS-method citrus.rename
###   citrus.run,UserSession,CITRUS-method citrus.run
###   citrus.show,UserSession-method citrus.show
###   citrus.status,UserSession,CITRUS-method citrus.status
###   citrus.update,UserSession,CITRUS-method citrus.update

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")

# cyto_citrus refers to a CITRUS object that is created from CITRUS endpoints
#   examples: citrus.new, citrus.show (see details section for more)
## End(No test)
## No test: 
citrus.copy_settings(cyto_session, citrus=cyto_citrus)
## End(No test)
## No test: 
citrus.delete(cyto_session, citrus=cyto_citrus)
## End(No test)
## No test: 
# Download a CITRUS analysis to the current working directory
citrus.download(cyto_session, citrus)

# Download a CITRUS analysis to a new directory
citrus.download(cyto_session, citrus, directory="/my/new/download/directory/")
## End(No test)
## No test: 
# Dataframe of all CITRUS advanced analyses with all fields present
citrus.list(cyto_session, 22)

# Raw list of all CITRUS advanced analyses with all fields present
citrus.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
citrus.new(cyto_session, 22, citrus_name="My new CITRUS analysis")
## End(No test)
## No test: 
citrus.rename(cyto_session, citrus=cyto_citrus, citrus_name="My updated CITRUS name")
## End(No test)
## No test: 
citrus.run(cyto_session, citrus=cyto_citrus)
## End(No test)
## No test: 
citrus.show(cyto_session, 22, citrus_id=2)
## End(No test)
## No test: 
citrus.status(cyto_session, citrus=cyto_citrus)
## End(No test)
## No test: 
citrus.update(cyto_session, citrus=cyto_citrus)
## End(No test)



