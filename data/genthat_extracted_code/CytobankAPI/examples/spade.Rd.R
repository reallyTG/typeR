library(CytobankAPI)


### Name: spade
### Title: SPADE Endpoints
### Aliases: spade spade.bubbles_export,UserSession,SPADE-method
###   spade.bubbles_export spade.bubbles_set,UserSession,SPADE-method
###   spade.bubbles_set spade.bubbles_show,UserSession,SPADE-method
###   spade.bubbles_show spade.copy_results,UserSession,SPADE-method
###   spade.copy_results spade.copy_settings,UserSession,SPADE-method
###   spade.copy_settings spade.delete,UserSession,SPADE-method
###   spade.delete spade.download_all,UserSession,SPADE-method
###   spade.download_all
###   spade.download_clusters_table,UserSession,SPADE-method
###   spade.download_clusters_table
###   spade.download_global_boundaries_table,UserSession,SPADE-method
###   spade.download_global_boundaries_table
###   spade.download_gml,UserSession,SPADE-method spade.download_gml
###   spade.download_layout_table,UserSession,SPADE-method
###   spade.download_layout_table
###   spade.download_statistics_tables,UserSession,SPADE-method
###   spade.download_statistics_tables spade.list,UserSession-method
###   spade.list spade.new,UserSession-method spade.new
###   spade.rename,UserSession,SPADE-method spade.rename
###   spade.run,UserSession,SPADE-method spade.run
###   spade.show,UserSession-method spade.show
###   spade.status,UserSession,SPADE-method spade.status
###   spade.update,UserSession,SPADE-method spade.update

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")

# cyto_spade refers to a SPADE object that is created from SPADE endpoints
#   examples: spade.new, spade.show (see details section for more)
## End(No test)
## No test: 
spade.bubbles_export(cyto_session, spade=cyto_spade, bubbles=c("bubble1", "bubble2"))
## End(No test)
## No test: 
named_bubble_list_of_node_vectors <- list("bubble_1"=c(1,2,4), "bubble_2"=8, "bubble_4"=c(10,12))
spade.bubbles_set(cyto_session, spade=cyto_spade, bubbles=named_bubble_list_of_node_vectors)
## End(No test)
## No test: 
spade.bubbles_show(cyto_session, spade=cyto_spade)
## End(No test)
## No test: 
spade.copy_results(cyto_session, spade=cyto_spade)
## End(No test)
## No test: 
spade.copy_settings(cyto_session, spade=cyto_spade)
## End(No test)
## No test: 
spade.delete(cyto_session, spade=cyto_spade)
## End(No test)
## No test: 
spade.download_all(cyto_session, spade=cyto_spade, directory="/my/new/download/directory/")
## End(No test)
## No test: 
spade.download_clusters_table(cyto_session, spade=cyto_spade,
  directory="/my/new/download/directory/")
## End(No test)
## No test: 
spade.download_global_boundaries_table(cyto_session,
  spade=cyto_spade, directory="/my/new/download/directory/")
## End(No test)
## No test: 
spade.download_gml(cyto_session, spade=cyto_spade, directory="/my/new/download/directory/")
## End(No test)
## No test: 
spade.download_layout_table(cyto_session, spade=cyto_spade, directory="/my/new/download/directory/")
## End(No test)
## No test: 
spade.download_statistics_tables(cyto_session, spade=cyto_spade,
  directory="/my/new/download/directory/")
## End(No test)
## No test: 
# Dataframe of all SPADE advanced analyses with all fields present
spade.list(cyto_session, 22)

# Raw list of all SPADE advanced analyses with all fields present
spade.list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
spade.new(cyto_session, 22, spade_name="My new SPADE analysis")
## End(No test)
## No test: 
spade.rename(cyto_session, spade=cyto_spade, spade_name="My updated SPADE name")
## End(No test)
## No test: 
spade.run(cyto_session, spade=cyto_spade)
## End(No test)
## No test: 
spade.show(cyto_session, 22, spade_id=2)
## End(No test)
## No test: 
spade.status(cyto_session, spade=cyto_spade)
## End(No test)
## No test: 
spade.update(cyto_session, spade=cyto_spade)
## End(No test)



