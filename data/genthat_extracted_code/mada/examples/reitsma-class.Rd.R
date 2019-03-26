library(mada)


### Name: reitsma-class
### Title: Methods for 'reitsma' objects.
### Aliases: reitsma-class sroc mcsroc sroc.reitsma mcsroc.reitsma
###   ROCellipse.reitsma crosshair.reitsma plot.reitsma summary.reitsma
###   print.reitsma anova.reitsma print.anova.reitsma
### Keywords: regression classes

### ** Examples

# load data
data(Dementia)
# fit model
fit <- reitsma(Dementia)
# calculate a confidence region but do not plot it
cr.Dementia <- ROCellipse(fit)
#calculate a SROC curve
sroc.Dementia <- sroc(fit)
# plot the confidence region in ROC space as a line
plot(cr.Dementia$ROCellipse, type = "l", xlim = c(0,1), ylim = c(0,1))
# add the point estimate of the mean
points(cr.Dementia$fprsens)
# add the SROC curve
lines(sroc.Dementia)




