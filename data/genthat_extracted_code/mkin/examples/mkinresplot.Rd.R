library(mkin)


### Name: mkinresplot
### Title: Function to plot residuals stored in an mkin object
### Aliases: mkinresplot
### Keywords: hplot

### ** Examples

model <- mkinmod(parent = mkinsub("SFO", "m1"), m1 = mkinsub("SFO"))
fit <- mkinfit(model, FOCUS_2006_D, quiet = TRUE)
mkinresplot(fit, "m1")



