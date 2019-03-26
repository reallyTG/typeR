library(imager)


### Name: as.data.frame.pixset
### Title: Methods to convert pixsets to various objects
### Aliases: as.data.frame.pixset convert_pixset

### ** Examples


px <- boats > 250
#Convert to array of logicals
as.logical(px) %>% dim
#Convert to data.frame: gives all pixel locations in the set
as.data.frame(px) %>% head
#Drop flat dimensions
as.data.frame(px,drop=TRUE) %>% head



