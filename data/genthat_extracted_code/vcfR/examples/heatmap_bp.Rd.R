library(vcfR)


### Name: heatmap.bp
### Title: Heatmap with barplots
### Aliases: heatmap.bp

### ** Examples

library(vcfR)

x  <- as.matrix(mtcars)

heatmap.bp(x)
heatmap.bp(x, scale="col")
# Use an alternate color ramp
heatmap.bp(x, col.ramp = colorRampPalette(c("red", "yellow", "#008000"))(100))
heatmap.bp(x)

## Not run: 
##D heatmap.bp(x, cbarplot = FALSE, rbarplot = FALSE, legend = FALSE)
##D heatmap.bp(x, cbarplot = FALSE, rbarplot = TRUE, legend = FALSE)
##D heatmap.bp(x, cbarplot = FALSE, rbarplot = FALSE, legend = TRUE)
##D heatmap.bp(x, cbarplot = FALSE, rbarplot = TRUE, legend = TRUE)
##D 
##D heatmap.bp(x, cbarplot = TRUE, rbarplot = FALSE, legend = FALSE)
##D heatmap.bp(x, cbarplot = TRUE, rbarplot = TRUE, legend = FALSE)
##D heatmap.bp(x, cbarplot = TRUE, rbarplot = FALSE, legend = TRUE)
##D heatmap.bp(x, cbarplot = TRUE, rbarplot = TRUE, legend = TRUE)
## End(Not run)

 



