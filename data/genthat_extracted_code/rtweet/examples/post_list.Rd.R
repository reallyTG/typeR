library(rtweet)


### Name: post_list
### Title: Manage Twitter lists
### Aliases: post_list

### ** Examples

## Not run: 
##D 
##D ## CNN twitter accounts
##D users <- c("cnn", "cnnbrk", "cnni", "cnnpolitics", "cnnmoney",
##D   "cnnnewsroom", "cnnspecreport", "CNNNewsource",
##D   "CNNNSdigital", "CNNTonight")
##D 
##D ## create CNN-accounts list with 9 total users
##D (cnn_lst <- post_list(users,
##D   "cnn-accounts", description = "Official CNN accounts"))
##D 
##D ## view list in browser
##D browseURL(sprintf("https://twitter.com/%s/lists/cnn-accounts",
##D   rtweet:::home_user()))
##D 
##D ## search for more CNN users
##D cnn_users <- search_users("CNN", n = 200)
##D 
##D ## filter and select more users to add to list
##D more_users <- cnn_users %>%
##D   subset(verified & !tolower(screen_name) %in% tolower(users)) %>%
##D   .$screen_name %>%
##D   grep("cnn", ., ignore.case = TRUE, value = TRUE)
##D 
##D ## add more users to list- note: can only add up to 100 at a time
##D post_list(users = more_users, slug = "cnn-accounts")
##D 
##D ## view updated list in browser (should be around 100 users)
##D browseURL(sprintf("https://twitter.com/%s/lists/cnn-accounts",
##D   rtweet:::home_user()))
##D 
##D ## select users on list without "cnn" in their name field
##D drop_users <- cnn_users %>%
##D   subset(screen_name %in% more_users & !grepl("cnn", name, ignore.case = TRUE)) %>%
##D   .$screen_name
##D 
##D ## drop these users from the cnn list
##D post_list(users = drop_users, slug = "cnn-accounts",
##D   destroy = TRUE)
##D 
##D ## view updated list in browser (should be around 100 users)
##D browseURL(sprintf("https://twitter.com/%s/lists/cnn-accounts",
##D   rtweet:::home_user()))
##D 
##D ## delete list entirely
##D post_list(slug = "cnn-accounts", destroy = TRUE)
##D 
## End(Not run)



