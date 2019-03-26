library(qdap)


### Name: qtheme
### Title: Add themes to a Network object.
### Aliases: qtheme theme_nightheat theme_badkitchen theme_cafe
###   theme_grayscale theme_greyscale theme_norah theme_hipster
###   theme_duskheat

### ** Examples

## Not run: 
##D (poldat <- with(sentSplit(DATA, 4), polarity(state, person)))
##D m <- Network(poldat)
##D m
##D 
##D m + theme_nightheat
##D m + theme_cafe
##D m + theme_grayscale
##D m + theme_norah
##D m + theme_hipster
##D m + theme_badkitchen
##D m + theme_duskheat
##D 
##D ## make your own themes
##D theme_irish <- qtheme(x = "irish", bg = "grey25", 
##D     vertex.label.color = "grey50", legend.text.color = "white",
##D     legend.gradient = c("darkgreen", "white", "darkorange"), 
##D     edge.label.color="white", vertex.size= 20)
##D 
##D m + theme_irish
## End(Not run)



