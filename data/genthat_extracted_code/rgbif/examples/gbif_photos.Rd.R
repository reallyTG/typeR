library(rgbif)


### Name: gbif_photos
### Title: View photos from GBIF.
### Aliases: gbif_photos

### ** Examples

## Not run: 
##D res <- occ_search(mediaType = 'StillImage', return = "media")
##D gbif_photos(res)
##D gbif_photos(res, which='map')
##D 
##D res <- occ_search(scientificName = "Aves", mediaType = 'StillImage',
##D   return = "media", limit=150)
##D gbif_photos(res)
##D gbif_photos(res, output = '~/barfoo')
## End(Not run)



