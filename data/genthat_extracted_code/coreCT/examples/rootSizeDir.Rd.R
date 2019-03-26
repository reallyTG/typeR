library(coreCT)


### Name: rootSizeDir
### Title: Convert a directory of raw DICOM images to root particle counts
###   and surface areas
### Aliases: rootSizeDir

### ** Examples

rootChars <- rootSizeDir("core_426", diameter.classes = c(2.5, 10))

## Not run: 
##D # plot using "ggplot" package after transforming with "reshape2" package
##D area.long <- reshape2::melt(rootChars, id.vars = c("depth"), 
##D    measure.vars = grep("Area", names(rootChars)))
##D ggplot2::ggplot(data = area.long, ggplot2::aes(y = -depth, x = value, 
##D    color = variable)) + ggplot2::geom_point() + ggplot2::theme_classic() + 
##D    ggplot2::xlab("root external surface area per slice (cm2)")
## End(Not run)




