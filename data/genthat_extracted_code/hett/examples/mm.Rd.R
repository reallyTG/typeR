library(hett)


### Name: mm
### Title: Excess returns for Martin Marietta company
### Aliases: mm
### Keywords: datasets

### ** Examples


data(mm, package = "hett")
attach(mm)
plot(CRSP, m.marietta)
lines(CRSP, fitted(lm(m.marietta ~ CRSP)), lty = 2)




