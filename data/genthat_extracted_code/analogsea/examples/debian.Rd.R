library(analogsea)


### Name: debian
### Title: Helpers for managing a debian droplets.
### Aliases: debian debian_add_swap debian_install_r debian_install_rstudio
###   debian_install_shiny debian_apt_get_update debian_apt_get_install
###   install_r_package

### ** Examples

## Not run: 
##D d <- droplet_create()
##D d %>% debian_add_swap()
##D d %>% debian_apt_get_update()
##D 
##D d %>% debian_install_r()
##D d %>% debian_install_rstudio()
##D 
##D # Install libcurl, then build RCurl from source
##D d %>% debian_apt_get_install("libcurl4-openssl-dev")
##D d %>% install_r_package("RCurl")
##D droplet_delete(d)
## End(Not run)



