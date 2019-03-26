library(agridat)


### Name: christidis.competition
### Title: Competition between varieties in cotton
### Aliases: christidis.competition
### Keywords: datasets

### ** Examples


data(christidis.competition)
dat <- christidis.competition

# Match Christidis Table 2 means
# aggregate(yield ~ gen, aggregate(yield ~ gen+plot, dat, sum), mean)

# Each RCB block has 2 replicates of each genotype
# with(dat, table(block,gen))

if(require(lattice)){

  # Tall plants yield more
  # xyplot(yield ~ height|gen, data=dat)

  # Huge yield variation across field. Also heterogeneous variance.
  xyplot(yield ~ col, dat, group=gen, auto.key=list(columns=5),
         main="christidis.competition")
}

## Not run: 
##D   require(lattice)
##D   require(mgcv)
##D   if(is.element("package:gam", search())) detach("package:gam")
##D   # Simple non-competition model to remove main effects
##D   m1 <- gam(yield ~ gen + s(col), data=dat)
##D   p1 <- as.data.frame(predict(m1, type="terms"))
##D   names(p1) <- c('geneff','coleff')
##D   dat2 <- cbind(dat, p1)
##D   dat2 <- transform(dat2, res=yield-geneff-coleff)
##D   xyplot(res ~  col, data=dat2, group=gen,
##D          main="christidis.competition - residuals")
## End(Not run)




