library(analogsea)


### Name: droplet_action
### Title: Perform various actions on a droplet.
### Aliases: droplet_action droplet_reboot droplet_power_cycle
###   droplet_shutdown droplet_power_off droplet_power_on
###   droplet_reset_password droplet_enable_ipv6
###   droplet_enable_private_networking droplet_enable_backups
###   droplet_disable_backups droplet_upgrade

### ** Examples

## Not run: 
##D d <- droplets()
##D d[[1]] %>% droplet_reboot()
##D d[[2]] %>% droplet_power_cycle()
##D 
##D d <- droplet_create()
##D d %>% summary
##D d %>% droplet_enable_backups()
##D d %>% summary
## End(Not run)



