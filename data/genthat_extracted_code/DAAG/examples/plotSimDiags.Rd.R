library(DAAG)


### Name: plotSimDiags
### Title: Diagnostic plots for simulated data
### Aliases: plotSimDiags
### Keywords: regression graphics

### ** Examples

women.lm <- lm(height ~ weight, data=women)
gphlist <- plotSimDiags(obj=women.lm, which=c(1:3,5))



