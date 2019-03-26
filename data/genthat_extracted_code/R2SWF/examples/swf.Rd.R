library(R2SWF)


### Name: swf
### Title: SWF graphics device
### Aliases: swf

### ** Examples

## Not run: 
##D ## A demonstration of K-means clustering, using animation package
##D if(require(animation)) {
##D     swf("kmeans.swf", frameRate = 1)
##D     kmeans.ani()
##D     dev.off()
##D }
##D 
##D ## Test built-in fonts in sysfonts package
##D swf("fonts.swf", 8, 8)
##D plot(1, type = "n")
##D 
##D par(family = "sans", cex = 2)
##D text(0.7, 1.3, "Sans-R", font = 1)
##D text(0.7, 1.1, "Sans-B", font = 2)
##D text(0.7, 0.9, "Sans-I", font = 3)
##D text(0.7, 0.7, "Sans-BI", font = 4)
##D 
##D par(family = "serif")
##D text(1.0, 1.3, "Serif-R", font = 1)
##D text(1.0, 1.1, "Serif-B", font = 2)
##D text(1.0, 0.9, "Serif-I", font = 3)
##D text(1.0, 0.7, "Serif-BI", font = 4)
##D 
##D par(family = "mono")
##D text(1.3, 1.3, "Mono-R", font = 1)
##D text(1.3, 1.1, "Mono-B", font = 2)
##D text(1.3, 0.9, "Mono-I", font = 3)
##D text(1.3, 0.7, "Mono-BI", font = 4)
##D 
##D dev.off()
## End(Not run)



