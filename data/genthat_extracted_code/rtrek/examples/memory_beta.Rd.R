library(rtrek)


### Name: memory_beta
### Title: Memory Beta API
### Aliases: memory_beta

### ** Examples

memory_beta("portals") # show available portals
endpoint <- "characters/Characters by races and cultures/Klingonoids/Klingons"
if(has_internet()){
  x <- memory_beta(endpoint)
  x <- x[grep("Worf", x$Klingons), ]
  x
  memory_beta(paste0(endpoint, "/Worf, son of Mogh")) # return terminal article content
}



