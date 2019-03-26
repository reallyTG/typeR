library(coreCT)


### Name: convDir
### Title: Convert a directory of raw DICOM images to material classes
### Aliases: convDir

### ** Examples

materials <- convDir("core_426", rootData = FALSE)


## Not run: 
##D  
##D # plot using "ggplot" package after transforming with "reshape2" package
##D mass.long <- reshape2::melt(materials, id.vars = c("depth"), 
##D    measure.vars = grep(".g", names(materials)))
##D ggplot2::ggplot(data = mass.long, ggplot2::aes(y = -depth, x = value, 
##D    color = variable)) + ggplot2::geom_point() + ggplot2::theme_classic() + 
##D    ggplot2::xlab("mass per section (g)") 
## End(Not run)




