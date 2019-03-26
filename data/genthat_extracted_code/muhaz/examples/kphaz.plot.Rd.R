library(muhaz)


### Name: kphaz.plot
### Title: kphaz.plot
### Aliases: kphaz.plot
### Keywords: survival

### ** Examples

# Use "kphaz.fit" to generate a hazard estimate
data(ovarian, package="survival")
attach(ovarian)
kpfit <- kphaz.fit(futime, fustat)
# Use "kphaz.plot" to plot the estimate
kphaz.plot(kpfit)



