library(SK)


### Name: skriging
### Title: Function for Segment-based Kriging models
### Aliases: skriging print.skriging plot.skriging

### ** Examples

## SRK: segment-based regression Kriging
## dataset 'vtest' is a sample of dataset 'vehicles'
srk1 <- skriging(heavy ~ wpai + width, polyline = vtest, method = "srk",
                 lwd = "width", obspred = "obs1pred0", boxcox = TRUE)
srk1
plot(srk1)




