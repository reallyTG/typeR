library(agridat)


### Name: allcroft.lodging
### Title: Multi-environment trial of cereal with lodging data
### Aliases: allcroft.lodging

### ** Examples


data("allcroft.lodging")
dat <- allcroft.lodging

# Transformation
dat$sy <- sqrt(dat$y)
# Variety 4 has no lodging anywhere, so add a small amount
dat[dat$env=='E5' & dat$gen=='G04',]$sy <- .01

require(lattice)
dotplot(env~y|gen, dat, as.table=TRUE,
        xlab="Percent lodged (by genotype)", ylab="Variety",
        main="allcroft.lodging")

# Tobit model
if(require(AER)){
  m3 <- tobit(sy ~ 1 + gen + env, left=0, right=100, data=dat)

  # Table 2 trial/variety means
  preds <- expand.grid(gen=levels(dat$gen), env=levels(dat$env))
  preds$pred <- predict(m3, newdata=preds)
  round(tapply(preds$pred, preds$gen, mean),2)
  round(tapply(preds$pred, preds$env, mean),2)

}




