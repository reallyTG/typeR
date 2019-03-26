library(metamisc)


### Name: fat
### Title: Regression tests for detecting funnel plot asymmetry
### Aliases: fat

### ** Examples

data(Fibrinogen)
b <- log(Fibrinogen$HR)
b.se <- ((log(Fibrinogen$HR.975) - log(Fibrinogen$HR.025))/(2*qnorm(0.975)))
n.total <- Fibrinogen$N.total
d.total <- Fibrinogen$N.events

fat(b=b, b.se=b.se)
fat(b=b, b.se=b.se, d.total=d.total, method="D-FIV")

# Note that many tests are also available via metafor
require(metafor)
fat(b=b, b.se=b.se, n.total=n.total, method="M-FIV")
regtest(x=b, sei=b.se, ni=n.total, model="lm", predictor="ni") 




