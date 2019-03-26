library(analogsea)


### Name: droplet_ssh
### Title: Remotely execute ssh code, upload & download files.
### Aliases: droplet_ssh droplet_upload droplet_download

### ** Examples

## Not run: 
##D d <- droplet_create() %>% droplet_wait()
##D 
##D # Upgrade system packages
##D d %>%
##D   droplet_ssh("apt-get update") %>%
##D   droplet_ssh("sudo apt-get upgrade -y --force-yes") %>%
##D   droplet_ssh("apt-get autoremove -y")
##D 
##D # Install R
##D d %>%
##D   droplet_ssh("apt-get install r-base-core r-base-dev --yes --force-yes")
##D 
##D # Upload and download files -------------------------------------------------
##D 
##D tmp <- tempfile()
##D saveRDS(mtcars, tmp)
##D d %>% droplet_upload(tmp, "mtcars.rds")
##D 
##D tmp2 <- tempfile()
##D d %>% droplet_download("mtcars.rds", tmp2)
##D mtcars2 <- readRDS(tmp2)
##D 
##D stopifnot(all.equal(mtcars, mtcars2))
## End(Not run)



