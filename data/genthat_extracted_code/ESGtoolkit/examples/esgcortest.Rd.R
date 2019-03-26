library(ESGtoolkit)


### Name: esgcortest
### Title: Correlation tests for the shocks
### Aliases: esgcortest

### ** Examples

nb <- 500

s0.par1 <- simshocks(n = nb, horizon = 3, frequency = "semi",
family = 1, par = 0.2)

s0.par2 <- simshocks(n = nb, horizon = 3, frequency = "semi",
family = 1, par = 0.8)

(test1 <- esgcortest(s0.par1))
(test2 <- esgcortest(s0.par2))
par(mfrow=c(2, 1))
esgplotbands(test1)
esgplotbands(test2)



