library(POT)


### Name: qq
### Title: Quantile Quantile Plot
### Aliases: qq qq.uvpot
### Keywords: hplot

### ** Examples

x <- rgpd(75, 1, 2, 0.1)
pwmu <- fitgpd(x, 1, "pwmu")
qq(pwmu)



