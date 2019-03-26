library(coreCT)


### Name: conv
### Title: Convert a matrix of semi-processed DICOM images to mass and
###   volume of material classes
### Aliases: conv

### ** Examples

ct.slope <- unique(extractHeader(core_426$hdr, "RescaleSlope"))
ct.int   <- unique(extractHeader(core_426$hdr, "RescaleIntercept")) 
# convert raw units to Hounsfield units
HU_426 <- lapply(core_426$img, function(x) x*ct.slope + ct.int)

materials <- conv(HU_426, pixelA = 0.0596)

## Not run: 
##D # plot using "ggplot" package after transforming with "reshape2" package
##D mass.long <- reshape2::melt(materials, id.vars = c("depth"), 
##D    measure.vars = grep(".g", names(materials)))
##D ggplot2::ggplot(data = mass.long, ggplot2::aes(y = -depth, x = value, 
##D    color = variable)) + ggplot2::geom_point() + ggplot2::theme_classic() + 
##D    ggplot2::xlab("mass per section (g)")
## End(Not run)




