library(natserv)


### Name: ns_images
### Title: NatureServe image metadata
### Aliases: ns_images

### ** Examples

## Not run: 
##D # search by uid
##D ns_images(uid = 'ELEMENT_GLOBAL.2.100925')
##D 
##D # search by common name and resolutio thumbnail
##D (res <- ns_images(commonName = "*eagle", resolution = 'thumbnail'))
##D 
##D # search "Ruby*", all common names [in any language], and highest
##D # resolution only:
##D (res <- ns_images(commonName = "Ruby*", includeSynonyms = 'y',
##D   resolution = 'highest'))
## End(Not run)



