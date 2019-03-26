library(analogsea)


### Name: droplet_snapshot
### Title: Take and restore snapshots.
### Aliases: droplet_snapshot droplet_snapshots_list droplet_restore
###   droplet_backups_list

### ** Examples

## Not run: 
##D d <- droplet_create()
##D d %>% droplet_snapshots_list()
##D d %>% droplet_backups_list()
##D 
##D d %>%
##D   droplet_power_off() %>%
##D   droplet_snapshot() %>%
##D   droplet_power_on() %>%
##D   droplet_snapshots_list()
##D 
##D # To delete safely
##D d %>%
##D   droplet_power_off() %>%
##D   droplet_snapshot() %>%
##D   droplet_delete() %>%
##D   action_wait()
## End(Not run)



