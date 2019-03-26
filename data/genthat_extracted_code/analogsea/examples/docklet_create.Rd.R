library(analogsea)


### Name: docklet_create
### Title: Docklets: docker on droplets.
### Aliases: docklet_create docklet_ps docklet_images docklet_pull
###   docklet_run docklet_stop docklet_rm docklet_docker docklet_rstudio
###   docklet_rstudio_addusers docklet_shinyserver docklet_shinyapp

### ** Examples

## Not run: 
##D d <- docklet_create()
##D d %>% docklet_pull("dockerpinata/sqlite")
##D d %>% docklet_images()
##D 
##D # sqlite
##D d %>% docklet_run("dockerpinata/sqlite", "sqlite3 --version", rm = TRUE)
##D d %>% docklet_ps()
##D 
##D # cowsay
##D d %>% docklet_pull("chuanwen/cowsay")
##D d %>% docklet_run("chuanwen/cowsay", rm = TRUE)
##D 
##D # docker images
##D d %>% docklet_images()
##D 
##D # install various R versions via Rocker
##D d %>% docklet_pull("rocker/r-base")
##D d %>% docklet_pull("rocker/r-devel")
##D d %>% docklet_pull("rocker/r-ver:3.2")
##D d %>% docklet_run("rocker/r-ver:3.2", "R --version", rm = TRUE)
##D d %>% docklet_run("rocker/r-ver:3.2", "Rscript -e '2 + 3'", rm = TRUE)
##D 
##D # Run a docklet containing rstudio
##D d %>% docklet_rstudio()
##D 
##D # Delete a droplet
##D d %>% droplet_delete()
##D 
##D # Add users to an Rstudio instance
##D ## This adds 100 users to the instance, with username/passwords
##D ## following pattern user1/user1 ... through 100
##D d <- docklet_create()
##D d %>% docklet_rstudio() %>% docklet_rstudio_addusers()
##D 
##D # Spin up a Shiny server (opens in default browser)
##D (d <- docklet_create())
##D d %>% docklet_shinyserver()
##D docklet_create() %>% docklet_shinyserver()
##D 
##D # Spin up a Shiny server with an app (opens in default browser)
##D d <- docklet_create()
##D path <- system.file("examples", "widgets", package = "analogsea")
##D d %>% docklet_shinyapp(path)
##D ## uploading more apps - use droplet_upload, then navigate in browser
##D ### if you try to use docklet_shinyapp again on the same droplet, it will error
##D path2 <- system.file("examples", "mpg", package = "analogsea")
##D d %>% droplet_upload(path2, "/srv/shinyapps/mpg") # then go to browser
## End(Not run)



