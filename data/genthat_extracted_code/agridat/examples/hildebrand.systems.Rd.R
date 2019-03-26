library(agridat)


### Name: hildebrand.systems
### Title: Multi-environment trial of maize for four cropping systems
### Aliases: hildebrand.systems

### ** Examples


data(hildebrand.systems)
dat <- hildebrand.systems

# Piepho 1998 Fig 1
require(lattice)
dotplot(yield ~ system, dat, groups=village, auto.key=TRUE,
        main="hildebrand.systems", xlab="cropping system by village")


# Plot of risk of 'failure' of System 2 vs System 1
s11 = .30;  s22 <- .92; s12 = .34
mu1 = 1.35; mu2 = 2.70
lambda <- seq(from=0, to=5, length=20)
system1 <- pnorm((lambda-mu1)/sqrt(s11))
system2 <- pnorm((lambda-mu2)/sqrt(s22))

# A simpler view
plot(lambda, system1, type="l", xlim=c(0,5), ylim=c(0,1),
     xlab="Yield level", ylab="Prob(yield < level)",
     main="hildebrand.systems - risk of failure for each system")
lines(lambda, system2, col="red")

# Prob of system 1 outperforming system 2. Table 8
pnorm((mu1-mu2)/sqrt(s11+s22-2*s12))
# .0331

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   # Environmental variance model, unstructured correlations
##D   
##D   dat <- dat[order(dat$system, dat$farm),]
##D   m1 <- asreml(yield ~ system, data=dat, rcov = ~us(system):farm)
##D   
##D   # Means, table 5
##D   p1 <- predict(m1, data=dat, classify="system")$predictions$pvals
##D   ##  system pred.value std.error  est.stat
##D   ##     CCA      1.164    0.2816 Estimable
##D   ##    CCAF      2.657    0.3747 Estimable
##D   ##      LM      1.35     0.1463 Estimable
##D   ##     LMF      2.7      0.2561 Estimable
##D   
##D   # Variances, table 5
##D   require(lucid)
##D   vc(m1)[c(2,4,7,11),]
##D   ##              effect component std.error z.ratio constr
##D   ##    R!system.CCA:CCA    1.11      0.4354     2.5    pos
##D   ##  R!system.CCAF:CCAF    1.966     0.771      2.5    pos
##D   ##      R!system.LM:LM    0.2996    0.1175     2.5    pos
##D   ##    R!system.LMF:LMF    0.9185    0.3603     2.5    pos
##D   
##D   # Stability variance model
##D   m2 <- asreml(yield ~ system, data=dat,
##D                random = ~ farm,
##D                rcov = ~ at(system):units)
##D   p2 <- predict(m2, data=dat, classify="system")$predictions$pvals
##D   
##D   # Variances, table 6
##D   vc(m2)
##D   ##                effect component std.error z.ratio constr
##D   ##         farm!farm.var 0.2996       0.1175     2.5    pos
##D   ##   system_CCA!variance 0.4136       0.1622     2.5    pos
##D   ##  system_CCAF!variance 1.267        0.4969     2.5    pos
##D   ##    system_LM!variance 0.0000002        NA      NA  bound
##D   ##   system_LMF!variance 0.5304       0.208      2.5    pos
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## # Environmental variance model, unstructured correlations
##D   
##D   ## dat <- dat[order(dat$system, dat$farm),]
##D   ## m1 <- asreml(yield ~ system, data=dat,
##D   ##              resid = ~us(system):farm)
##D   
##D   ## # Means, table 5
##D   ## p1 <- predict(m1, data=dat, classify="system")$pvals
##D   ## ##  system pred.value std.error  est.stat
##D   ## ##     CCA      1.164    0.2816 Estimable
##D   ## ##    CCAF      2.657    0.3747 Estimable
##D   ## ##      LM      1.35     0.1463 Estimable
##D   ## ##     LMF      2.7      0.2561 Estimable
##D   
##D   ## # Variances, table 5
##D   ## require(lucid)
##D   ## vc(m1)[c(2,4,7,11),]
##D   ## ##              effect component std.error z.ratio constr
##D   ## ##    R!system.CCA:CCA    1.11      0.4354     2.5    pos
##D   ## ##  R!system.CCAF:CCAF    1.966     0.771      2.5    pos
##D   ## ##      R!system.LM:LM    0.2996    0.1175     2.5    pos
##D   ## ##    R!system.LMF:LMF    0.9185    0.3603     2.5    pos
##D   
##D   ## # Stability variance model
##D   ## m2 <- asreml(yield ~ system, data=dat,
##D   ##              random = ~ farm,
##D   ##              resid = ~ dsum( ~ units|system))
##D   ## m2 <- update(m2)
##D   ## p2 <- predict(m2, data=dat, classify="system")$pvals
##D   
##D   ## # Variances, table 6
##D   ## vc(m2)
##D   ## ##                effect component std.error z.ratio constr
##D   ## ##         farm!farm.var 0.2996       0.1175     2.5    pos
##D   ## ##   system_CCA!variance 0.4136       0.1622     2.5    pos
##D   ## ##  system_CCAF!variance 1.267        0.4969     2.5    pos
##D   ## ##    system_LM!variance 0.0000002        NA      NA  bound
##D   ## ##   system_LMF!variance 0.5304       0.208      2.5    pos
## End(Not run)





