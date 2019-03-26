library(SAR)


### Name: rec_model
### Title: Azure product recommendations model class
### Aliases: rec_model
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # get a recommender endpoint and previously-trained model
##D rec_endp <- rec_endpoint$new("myrecusacvjwpk4raost", admin_key="key1", rec_key="key2")
##D rec_model <- rec_endp$get_model("model1")
##D 
##D data(ms_usage)
##D 
##D # item recommendations for a set of user IDs
##D users <- unique(ms_usage$user)[1:5]
##D rec_model$user_predict(users)
##D 
##D # item recommendations for a set of user IDs and transactions (assumed to be new)
##D user_df <- subset(ms_usage, user %in% users)
##D rec_model$user_predict(user_df)
##D 
##D # item recomendations for a set of item IDs
##D items <- unique(ms_usage$item)[1:5]
##D rec_model$item_predict(items)
##D 
## End(Not run)



