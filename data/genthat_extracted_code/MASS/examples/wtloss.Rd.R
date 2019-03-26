library(MASS)


### Name: wtloss
### Title: Weight Loss Data from an Obese Patient
### Aliases: wtloss
### Keywords: datasets

### ** Examples

wtloss.fm <- nls(Weight ~ b0 + b1*2^(-Days/th),
    data = wtloss, start = list(b0=90, b1=95, th=120))
wtloss.fm
plot(wtloss)
with(wtloss, lines(Days, fitted(wtloss.fm)))



