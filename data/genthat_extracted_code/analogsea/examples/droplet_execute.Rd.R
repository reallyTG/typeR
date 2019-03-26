library(analogsea)


### Name: droplet_execute
### Title: Execute R code on a droplet.
### Aliases: droplet_execute

### ** Examples

## Not run: 
##D d <- droplet_create() %>%
##D   debian_add_swap() %>%
##D   droplet_ssh("apt-get update") %>%
##D   debian_install_r()
##D 
##D results <- d %>% droplet_execute({
##D   x <- letters
##D   numbers <- runif(1000)
##D })
##D results$x
##D results$numbers
##D 
##D droplet_delete(d)
## End(Not run)



