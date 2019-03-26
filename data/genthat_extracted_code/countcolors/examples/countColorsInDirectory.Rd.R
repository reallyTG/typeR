library(countcolors)


### Name: countColorsInDirectory
### Title: Count colors within range(s) in every image in a directory
### Aliases: countColorsInDirectory

### ** Examples

## Not run: 
##D folder <- system.file("extdata", package = "countcolors")
##D 
##D # Screen out white in both the flower image and the pelican image
##D upper <- c(1, 1, 1)
##D lower <- c(0.8, 0.8, 0.8)
##D 
##D white.screen <- countcolors::countColorsInDirectory(folder, color.range =
##D "rectangular", upper = upper, lower = lower, bg.lower = NULL, plotting =
##D TRUE, target.color = "turquoise")
## End(Not run)



