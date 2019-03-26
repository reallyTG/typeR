library(rbraries)


### Name: subscriptions
### Title: Subscriptions
### Aliases: subscriptions lio_subscriptions lio_subscribed lio_subscribe
###   lio_subscription_update lio_subscription_delete

### ** Examples

## Not run: 
##D # authenticated user Libraries.io subscriptions
##D lio_subscriptions()
##D 
##D # check if you are subscribed to a project
##D lio_subscribed("rubygems", "webmock")
##D 
##D # subscribe to a project
##D lio_subscribe(platform = "rubygems", name = "webmock")
##D 
##D # update subscription to a project
##D lio_subscription_update("rubygems", "webmock")
##D 
##D # delete subscription to a project
##D lio_subscription_delete("rubygems", "webmock")
## End(Not run)



