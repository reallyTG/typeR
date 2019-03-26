library(lme4)


### Name: mkReTrms
### Title: Make Random Effect Terms: Create Z, Lambda, Lind, etc.
### Aliases: mkReTrms
### Keywords: utilities

### ** Examples

data("Pixel", package="nlme")
mform <- pixel ~ day + I(day^2) + (day | Dog) + (1 | Side/Dog)
(bar.f <- findbars(mform)) # list with 3 terms
mf <- model.frame(subbars(mform),data=Pixel)
rt <- mkReTrms(bar.f,mf)
names(rt)



