library(CHNOSZ)


### Name: water
### Title: Properties of Water
### Aliases: water water.SUPCRT92 water.IAPWS95 water.DEW

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## calculations along saturation curve
T <- seq(273.15, 623.15, 25)
# liquid density, from SUPCRT92
water("rho", T=T, P="Psat")
# values of the saturation pressure, Gibbs energy	
water(c("Psat", "G"), T=T, P="Psat") 
# derivatives of the dielectric constant (Born functions)
water(c("QBorn", "YBorn", "XBorn"), T=T, P="Psat")
# now at constant pressure
water(c("QBorn", "YBorn", "XBorn"), T=T, P=2000)

## comparing the formulations
T <- convert(c(25, 100, 200, 300), "K")
# IAPWS-95
oldwat <- water("IAPWS95")
water(water.IAPWS95(), T=T)
# Deep Earth Water (DEW)
water("DEW")
water(water.DEW(), T=T, P=1000)
# SUPCRT92 (the default)
water(oldwat)
water(water.SUPCRT92(), T=T)

## calculating Q Born function
# after Table 22 of Johnson and Norton, 1991
T <- rep(c(375, 400, 425, 450, 475), each=5)
P <- rep(c(250, 300, 350, 400, 450), 5)
w <- water("QBorn", T=convert(T, "K"), P=P)
# the rest is to make a neat table
w <- as.data.frame(matrix(w[[1]], nrow=5))
colnames(w) <- T[1:5*5]
rownames(w) <- P[1:5]
print(w)



