library(mada)


### Name: phm-class
### Title: Methods for 'phm' objects.
### Aliases: phm-class sroc.phm plot.phm summary.phm print.phm
### Keywords: regression classes

### ** Examples

# load data
data(AuditC)
# fit model
fit <- phm(AuditC)
#calculate a SROC curve, but do not plot it
sroc.AuditC <- sroc(fit)
# plot the SROC curve in ROC space as a line
plot(sroc.AuditC, type = "l")
# Fancy version using plot
plot(fit)



