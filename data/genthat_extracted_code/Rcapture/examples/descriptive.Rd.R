library(Rcapture)


### Name: descriptive
### Title: Descriptive Statistics
### Aliases: descriptive print.descriptive plot.descriptive
### Keywords: univar

### ** Examples

data(hare)
hare.desc <- descriptive(hare)
hare.desc
plot(hare.desc)

data(cbird)
cbird.desc1 <- descriptive(cbird, dfreq = TRUE, dtype = "nbcap", t = 11)
plot(cbird.desc1)
# To illustrate the option t = Inf
cbird.desc2 <- descriptive(cbird, dfreq = TRUE, dtype = "nbcap", t = Inf)
plot(cbird.desc2)
# the y coordinate has changed



