library(coreCT)


### Name: rootSize
### Title: Convert a matrix of semi-processed DICOM images to root particle
###   counts, volumes, and surface areas
### Aliases: rootSize

### ** Examples

ct.slope <- unique(extractHeader(core_426$hdr, "RescaleSlope"))
ct.int   <- unique(extractHeader(core_426$hdr, "RescaleIntercept")) 
# convert raw units to Hounsfield units
HU_426 <- lapply(core_426$img, function(x) x*ct.slope + ct.int)

rootChars <- rootSize(HU_426, pixelA = 0.0596,
diameter.classes = c(2.5, 10))

## Not run: 
##D # plot using "ggplot" package after transforming with "reshape2" package
##D area.long <- reshape2::melt(rootChars, id.vars = c("depth"), 
##D    measure.vars = grep("Area", names(rootChars)))
##D ggplot2::ggplot(data = area.long, ggplot2::aes(y = -depth, x = value, 
##D    color = variable)) + ggplot2::geom_point() + ggplot2::theme_classic() + 
##D    ggplot2::xlab("root external surface area per slice (cm2)")
## End(Not run)




