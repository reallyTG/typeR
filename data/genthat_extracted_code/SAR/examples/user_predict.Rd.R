library(SAR)


### Name: user_predict
### Title: Get personalised recommendations from a SAR model
### Aliases: user_predict set_sar_threads

### ** Examples


data(ms_usage)
mod <- sar(ms_usage)

# item recommendations given a vector of user IDs
users <- unique(ms_usage$user)[1:5]
user_predict(mod, userdata=users)

# item recommendations given a set of user IDs and transactions (assumed to be new)
user_df <- subset(ms_usage, user %in% users)
user_predict(mod, userdata=user_df)

# item recomendations for a set of item IDs
items <- unique(ms_usage$item)[1:5]
item_predict(mod, items=items)

# setting the number of threads to use when computing recommendations
set_sar_threads(2)




