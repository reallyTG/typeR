library(agridat)


### Name: pacheco.soybean
### Title: Multi-environment trial of soybean in Brazil.
### Aliases: pacheco.soybean
### Keywords: datasets

### ** Examples


data(pacheco.soybean)
dat <- pacheco.soybean

# AMMI biplot similar to Fig 2 of Pacheco et al.
if(require(agricolae)){
  m1 <- with(dat, AMMI(env, gen, REP=1, yield))
  bip <- m1$biplot[,1:3]
  # Fig 1 of Pacheco et al.
  with(bip, plot(yield, PC1, cex=0.0,
                 text(yield,PC1,labels=row.names(bip), col="blue"),
                 xlim=c(1000,3000),main="pacheco.soybean - AMMI biplot",frame=TRUE))
  with(bip[19:29,], points(yield, PC1, cex=0.0,
                           text(yield,PC1,labels=row.names(bip[19:29,]),
                                col="darkgreen")))
}




