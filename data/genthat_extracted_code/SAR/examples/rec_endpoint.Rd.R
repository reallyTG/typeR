library(SAR)


### Name: rec_endpoint
### Title: Azure product recommendations endpoint class
### Aliases: rec_endpoint
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # creating a recommendations service endpoint from an Azure resource
##D svc <- resgroup$get_rec_service("myrec")
##D rec_endp <- svc$get_rec_endpoint()
##D 
##D # creating the endpoint from scratch -- must supply admin, recommender and storage keys
##D rec_endp <- rec_endpoint$new("myrecusacvjwpk4raost",
##D     admin_key="key1", rec_key="key2", storage_key="key3")
##D 
##D # upload the Microsoft store data
##D data(ms_usage)
##D rec_endp$upload_data(ms_usage)
##D 
##D # train a recommender
##D rec_model <- rec_endp$train_model("model1", usage="ms_usage.csv", support_threshold=10,
##D     similarity="Jaccard", user_affinity=TRUE, user_to_items=TRUE,
##D     backfill=TRUE, include_seed_items=FALSE)
##D 
##D # list of trained models
##D rec_endp$sync_model_list()
##D 
##D # delete the trained model (will ask for confirmation)
##D rec_endp$delete_model("model1")
##D 
## End(Not run)



