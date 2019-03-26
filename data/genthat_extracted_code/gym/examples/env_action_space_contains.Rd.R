library(gym)


### Name: env_action_space_contains
### Title: Evaluate whether an action is a member of an environments's
###   action space.
### Aliases: env_action_space_contains

### ** Examples

## Not run: 
##D remote_base <- "http://127.0.0.1:5000"
##D client <- create_GymClient(remote_base)
##D env_id <- "CartPole-v0"
##D instance_id <- env_create(client, env_id)
##D action <- env_action_space_sample(client, instance_id)
##D env_action_space_contains(client, instance_id, action)
## End(Not run)



