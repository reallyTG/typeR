library(CytobankAPI)


### Name: visne
### Title: viSNE Endpoints
### Aliases: visne visne.copy_settings,UserSession,viSNE-method
###   visne.copy_settings visne.delete,UserSession,viSNE-method
###   visne.delete visne.list,UserSession-method visne.list
###   visne.new,UserSession-method visne.new
###   visne.rename,UserSession,viSNE-method visne.rename
###   visne.run,UserSession,viSNE-method visne.run
###   visne.show,UserSession-method visne.show
###   visne.status,UserSession,viSNE-method visne.status
###   visne.update,UserSession,viSNE-method visne.update
###   visne.helper.set_populations

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")

# cyto_visne refers to a viSNE object that is created from viSNE endpoints
#   examples: visne.new, visne.show (see details section for more)
## End(No test)
## No test: 
visne.copy_settings(cyto_session, visne=cyto_visne)
## End(No test)
## No test: 
visne.delete(cyto_session, visne=cyto_visne)
## End(No test)
## No test: 
# Dataframe of all viSNE advanced analyses with all fields present
visne.list(cyto_session, 22)

# Raw list of all viSNE advanced analyses with all fields present
visne.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
visne.new(cyto_session, 22, visne_name="My new viSNE analysis")
## End(No test)
## No test: 
visne.rename(cyto_session, visne=cyto_visne, visne_name="My updated viSNE name")
## End(No test)
## No test: 
visne.run(cyto_session, visne=cyto_visne)
## End(No test)
## No test: 
visne.show(cyto_session, 22, visne_id=2)
## End(No test)
## No test: 
visne.status(cyto_session, visne=cyto_visne)
## End(No test)
## No test: 
visne.update(cyto_session, visne=cyto_visne)
## End(No test)
## No test: 
visne.helper.set_populations(visne=cyto_visne, population_id=1, fcs_files=c(1,2,3))
## End(No test)



