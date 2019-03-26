library(RSauceLabs)


### Name: createUser
### Title: Create a sub account
### Aliases: createUser

### ** Examples

## Not run: 
##D myAcc <- account()
##D appData <- getUser(myAcc)
##D 
##D createUser(myAcc, newUsername = "superstartester", password = "johndoe"
##D            , name = "John", email = "superstartester@example.com")
##D # $errors
##D # [1] "Subaccount capacity exhausted."
##D uC <- getUserConcurrency(myAcc)
##D #> rbindlist(uC$concurrency$self[c("allowed", "current")], fill = TRUE)
##D #manual mac overall real_device
##D #1:      5   5       5           0
##D #2:      0   0       0          NA
##D users <- getListOfSubAccounts(myAcc)
##D #> users$users_total
##D #[1] 1
##D siblings <- getListOfSiblingAccounts(myAcc)
##D #> getListOfSiblingAccounts(myAcc)
##D #list()
##D subAcc <- getSubAccountInformation(myAcc)
##D 
##D # change accesskey for a user
##D # changeAccessKey(myAcc, "rsaucelabs")
## End(Not run)



