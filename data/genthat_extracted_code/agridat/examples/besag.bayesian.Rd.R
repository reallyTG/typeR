library(agridat)


### Name: besag.bayesian
### Title: Spring barley in United Kingdom
### Aliases: besag.bayesian
### Keywords: datasets

### ** Examples


data(besag.bayesian)
dat <- besag.bayesian

# Yield values were scaled to unit variance
var(dat$yield, na.rm=TRUE)

# Besag Fig 2. Reverse row numbers to match Besag, Davison
dat$rrow <- 76 - dat$row
require("lattice")
xyplot(yield ~ rrow|col, dat, layout=c(1,3), type='s',
       xlab="row", ylab="yield", main="besag.bayesian")

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   
##D   # Use asreml to fit a model with AR1 gradient in rows
##D   
##D   dat <- transform(dat, cf=factor(col), rf=factor(rrow))
##D   m1 <- asreml(yield ~ -1 + gen, data=dat, random=~ar1v(rf))
##D   m1 <- update(m1)
##D   
##D   # Visualize trends, similar to Besag figure 2.
##D   dat$res <- m1$residuals
##D   dat$geneff <- coef(m1)$fixed[as.numeric(dat$gen)]
##D   dat <- transform(dat, fert=yield-geneff-res)
##D   xyplot(geneff ~ rrow|col, dat, layout=c(1,3), type='s',
##D          main="Variety effects", ylim=c(5,15 ))
##D   xyplot(fert ~ rrow|col, dat, layout=c(1,3), type='s',
##D          main="Fertility", ylim=c(-2,2))
##D   xyplot(res ~ rrow|col, dat, layout=c(1,3), type='s',
##D          main="Residuals", ylim=c(-4,4))
##D   
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   
##D   ## require(asreml4)
##D   
##D   ## # Use asreml to fit a model with AR1 gradient in rows
##D   
##D   ## dat <- transform(dat, cf=factor(col), rf=factor(rrow))
##D   ## m1 <- asreml(yield ~ -1 + gen, data=dat, random=~ar1v(rf))
##D   ## m1 <- update(m1)
##D   ## m1 <- update(m1)
##D   ## m1 <- update(m1)
##D   ## m1 <- update(m1)
##D   ## m1 <- update(m1)
##D   ## m1 <- update(m1)
##D   
##D   ## # Visualize trends, similar to Besag figure 2.
##D   ## dat$res <- resid(m1)
##D   ## dat$geneff <- coef(m1)$fixed[as.numeric(dat$gen)]
##D   ## dat <- transform(dat, fert=yield-geneff-res)
##D   ## xyplot(geneff ~ rrow|col, dat, layout=c(1,3), type='s',
##D   ##        main="Variety effects", ylim=c(5,15 ))
##D   ## xyplot(fert ~ rrow|col, dat, layout=c(1,3), type='s',
##D   ##        main="Fertility", ylim=c(-2,2))
##D   ## xyplot(res ~ rrow|col, dat, layout=c(1,3), type='s',
##D   ##        main="Residuals", ylim=c(-4,4))
##D 
## End(Not run)




