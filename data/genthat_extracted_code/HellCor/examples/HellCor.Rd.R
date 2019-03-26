library(HellCor)


### Name: HellCor
### Title: The Hellinger Correlation
### Aliases: HellCor
### Keywords: package

### ** Examples


# We illustrate the application of our new measure using data extracted
#  from a study on the coral reef published in
#  [Graham, N.A.J. and Wilson, S.K. and Carr, P. and Hoey, A.S. and
#   Jennings, S. and MacNeil, M.A. (2018), Seabirds enhance coral reef
#   productivity and functioning in the absence of invasive rats, Nature,
#   559, 250--253.]. 
# The two variables we consider are the number of fishes and the nitrogen 
# input by seabirds per hectare recorded on n = 12 islands in the Chagos
# Archipelago. Nitrogen input is an indirect measure of the abundance of
# seabirds. It is worthwhile to notice that nitrogen is absorbed by algae 
# and that herbivorous fishes eat these algae. Fishes and birds living in 
# two different worlds, it might seem odd to suspect a dependence between 
# these two variables. Since our measure is tailored to capture dependence 
# induced by a lurking variable, we can suspect the existence of such a
# hidden variable. This is indeed what researchers in (Graham et al., 2018) 
# were able to show by finding that the presence and abundance of rats on 
# an island had dramatic effects on the number of seabirds (the rats eating 
# their eggs) and consequently on the input of nitrogen in seabirds' guano. 
# In turn, this would diminish the abundance of algae and fishes eating
# these algae.

data(Chagos)
n <- nrow(Chagos)

par.save <- par()$mfrow
par(mfrow = c(1, 2))
plot(Chagos$Seabirds_ha, Chagos$Number_of_fishes, main = "Original data",
     xlab = "Density of seabirds", ylab = "Density of fishes")
plot(rank(Chagos$Seabirds_ha) / (n + 1), rank(Chagos$Number_of_fishes) /
     (n + 1), main = "Rank-Copula transformed data",
     xlab = "Density of seabirds", ylab = "Density of fishes")
par(mfrow = par.save)

set.seed(1)
# Empirical Hellinger correlation
HellCor(Chagos$Seabirds_ha, Chagos$Number_of_fishes, pvalue = TRUE)
# Pearson correlation
cor.test(Chagos$Seabirds_ha, Chagos$Number_of_fishes)
# Distance correlation
dcor.test(Chagos$Seabirds_ha, Chagos$Number_of_fishes, R = 200)


set.seed(1)
# Empirical Hellinger correlation
HellCor(Chagos$kg_N_ha_yr, Chagos$Seabirds_ha, pvalue = TRUE)
# Pearson correlation
cor.test(Chagos$kg_N_ha_yr, Chagos$Seabirds_ha)
# Distance correlation
dcor.test(Chagos$kg_N_ha_yr, Chagos$Seabirds_ha, R = 200)

set.seed(1)
# Empirical Hellinger correlation
HellCor(Chagos$kg_N_ha_yr, Chagos$Number_of_fishes, pvalue = TRUE)
# Pearson correlation
cor.test(Chagos$kg_N_ha_yr, Chagos$Number_of_fishes)
# Distance correlation
dcor.test(Chagos$kg_N_ha_yr, Chagos$Number_of_fishes, R = 200)

t.test(Chagos$kg_N_ha_yr ~ Chagos$Treatment)

######################################################################
# Geenens G., Lafaye de Micheaux P., (2018). The Hellinger correlation
######################################################################
# Figure 2

n < -500

set.seed(1)
par(mfrow = c(3, 5))

XX <- .datagenW.corrected(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(W~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenDiamond(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Diamond~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenParabola.corrected(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Parabola~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagen2Parabolas.corrected(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Two~~parabolae~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenCircle.corrected(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Circle~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagen4indclouds(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(4~~clouds~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenCubic(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Cubic~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenSine(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Sine~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenWedge(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Wedge~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenCross(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Cross~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenSpiral(n,sigma=0.05)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Spiral~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagen4Circles(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Circles~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenHeavysine(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Heavisine~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagenDoppler(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(Doppler~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))

XX <- .datagen5Clouds(n)
plot(XX,xlab=expression(X[1]),ylab=expression(X[2]))
etahat<-HellCor(XX[,1], XX[,2])$Hcor
title(main=substitute(5~~clouds~~-~~hat(eta)==etahat, list(etahat = round(etahat,3))))





