library(CytobankAPI)


### Name: experiments
### Title: Experiment Endpoints
### Aliases: experiments experiments.clone_full,UserSession-method
###   experiments.clone_full experiments.clone_selective,UserSession-method
###   experiments.clone_selective experiments.delete,UserSession-method
###   experiments.delete
###   experiments.full_access_users_list,UserSession-method
###   experiments.full_access_users_list
###   experiments.full_access_users_add,UserSession-method
###   experiments.full_access_users_add
###   experiments.full_access_users_remove,UserSession-method
###   experiments.full_access_users_remove
###   experiments.list,UserSession-method experiments.list
###   experiments.new,UserSession-method experiments.new
###   experiments.show,UserSession-method experiments.show
###   experiments.trash,UserSession-method experiments.trash
###   experiments.update,UserSession-method experiments.update

### ** Examples

## No test: 
# Authenticate via username/password
cyto_session <- authenticate(site="premium", username="cyril_cytometry", password="cytobank_rocks!")
# Authenticate via auth_token
cyto_session <- authenticate(site="premium", auth_token="my_secret_auth_token")
## End(No test)
## No test: 
experiments.clone_full(cyto_session, 22)
## End(No test)
## No test: 
experiments.clone_selective(cyto_session, 22,
  experiment_name="My New Experiment Name", fcs_files=c(12, 13, 14, 15, 16))
## End(No test)
## No test: 
experiments.delete(cyto_session, 22)
## End(No test)
## No test: 
# Dataframe of all full access users
experiments.full_access_users_list(cyto_session, 22)

# List of all full access users
experiments.full_access_users_list(cyto_session, 22, output="raw")
## End(No test)
## No test: 
# Add a user as a full access user by user's ID
experiments.full_access_users_add(cyto_session, 22, user_id=2)

# Add a user as a full access user by user's email
experiments.full_access_users_add(cyto_session, 22, user_email="sammy_cytometry@cytobank.org")

# Add a user as a full access user by user's username
experiments.full_access_users_add(cyto_session, 22, username="sammy_cytometry")
## End(No test)
## No test: 
# Remove a user as a full access user by user's ID
experiments.full_access_users_remove(cyto_session, 22, user_id=2)

# Remove a user as a full access user by user's email
experiments.full_access_users_remove(cyto_session, 22, user_email="sammy_cytometry@cytobank.org")

# Remove a user as a full access user by user's username
experiments.full_access_users_remove(cyto_session, 22, username="sammy_cytometry")
## End(No test)
## No test: 
# Dataframe of all inbox experiments with all fields present
experiments.list(cyto_session)

# Raw list of all inbox experiments with all fields present
experiments.list(cyto_session, output="raw")
## End(No test)
## No test: 
experiments.new(cyto_session, "My New Experiment Name", "My experiment purpose",
  "An optional comment")
## End(No test)
## No test: 
experiments.show(cyto_session, 22)
## End(No test)
## No test: 
experiments.trash(cyto_session, 22)
## End(No test)
## No test: 
experiments.update(cyto_session, experiment=cyto_experiment)
## End(No test)



