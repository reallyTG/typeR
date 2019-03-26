library(openCR)


### Name: JS.counts
### Title: Summarise Non-spatial Open-population Data
### Aliases: JS.counts m.array bd.array
### Keywords: manip

### ** Examples


JS.counts(ovenCH)
m.array(ovenCH)

## probabilities of b,d pairs
fit <- openCR.fit(ovenCH, type = 'JSSAbCL')
beta <- predict(fit)$b$estimate
phi <- predict(fit)$phi$estimate
bd.array(beta, phi)




