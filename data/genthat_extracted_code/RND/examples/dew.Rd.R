library(RND)


### Name: dew
### Title: Edgeworth Density
### Aliases: dew

### ** Examples


#
# Look at a true lognorma density & related dew
#
r       = 0.05
y       = 0.03
s0      = 1000
sigma   = 0.25
te      = 100/365
strikes = seq(from=600, to = 1400, by = 1)
v       = sqrt(exp(sigma^2 * te) - 1)
ln.skew = 3 * v + v^3
ln.kurt = 16 * v^2 + 15 * v^4 + 6 * v^6 + v^8

skew.4 = ln.skew * 1.50
kurt.4 = ln.kurt * 1.50

skew.5 = ln.skew * 0.50
kurt.5 = ln.kurt * 2.00

ew.density.4   = dew(x=strikes, r=r, y=y, te=te, s0=s0, sigma=sigma, 
                     skew=skew.4, kurt=kurt.4)
ew.density.5   = dew(x=strikes, r=r, y=y, te=te, s0=s0, sigma=sigma, 
                     skew=skew.5, kurt=kurt.5)
bsm.density    = dlnorm(x = strikes, meanlog = log(s0) + (r - y - (sigma^2)/2)*te, 
                 sdlog = sigma*sqrt(te), log = FALSE)

matplot(strikes, cbind(bsm.density, ew.density.4, ew.density.5), type="l", 
        lty=c(1,1,1), col=c("black","red","blue"), 
        main="Black = BSM,  Red = EW 1.5 Times,  Blue = EW 0.50 & 2")



