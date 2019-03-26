library(oce)


### Name: plot,sealevel-method
### Title: Plot Sealevel Data
### Aliases: plot,sealevel-method plot.sealevel

### ** Examples

library(oce)
data(sealevel)
## local Halifax time is UTC + 4h; see [2] on timing
juan <- as.POSIXct("2003-09-29 00:15:00", tz="UTC")+4*3600
plot(sealevel, which=1, xlim=juan+86400*c(-7, 7))
abline(v=juan, col='red')




