library(iMediate)


### Name: pwr.mdn
### Title: Power and Sample Size for Mediation Analysis
### Aliases: pwr.mdn
### Keywords: power

### ** Examples


n = 100
X = rnorm(n)
s2X = mean((X-mean(X))^2)
a=0.3
b=0.3
c.p = a*b

pwr.mdn(a, b, c.p, 1/s2X, 1/s2X, alpha=0.05, power=0.8)   
pwr.mdn(a, b, c.p, 1/s2X, 1/s2X, alpha=0.05, n=200)

## Using standardized coefficients
pwr.mdn(a, b, c.p, 1-a^2, 1-c.p^2-b^2-2*a*b*c.p, alpha=0.05, power=0.8)
pwr.mdn(a, b, c.p, 1-a^2, 1-c.p^2-b^2-2*a*b*c.p, alpha=0.05, n=200)




