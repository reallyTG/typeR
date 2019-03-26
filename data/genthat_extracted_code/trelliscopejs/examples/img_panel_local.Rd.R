library(trelliscopejs)


### Name: img_panel_local
### Title: Cast a vector of URLs pointing to local images as an image panel
###   source
### Aliases: img_panel_local

### ** Examples

## Not run: 
##D # assuming images are available locally in relative path pokemon_local/images
##D pokemon$img <- img_panel_local(paste0("images/", basename(pokemon$url_image)))
##D trelliscope(pokemon, name = "pokemon", path = "pokemon_local")
## End(Not run)



