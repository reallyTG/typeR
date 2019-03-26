library(CHNOSZ)


### Name: util.water
### Title: Functions for Properties of Water and Steam
### Aliases: util.water WP02.auxiliary rho.IAPWS95 water.AW90

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
# calculate density of stable phase at 500 K, 500 bar
rho <- rho.IAPWS95(T=500, P=500)
# calculate pressure (= 50 MPa) at this density
IAPWS95("P", T=500, rho=rho)
# calculate dielectric constant 	
water.AW90(T=500, rho=rho, P=50)

# density along saturation curve
T <- seq(273.15, 623.15, 25)
WP02.auxiliary(T=T)  # liquid from WP02
WP02.auxiliary("rho.vapor", T)  # vapor from WP02	

# WP02.auxiliary gives a close estimate of saturation pressure...
T <- 445:455
P.sigma <- WP02.auxiliary("P.sigma", T)
# ... but alternates between being just on the liquid or vapor side
# (low rho: steam; high rho: water)
rho.IAPWS95(T, convert(P.sigma, "bar"))
# thermo$opt$IAPWS.sat allows for choosing liquid or vapor or ""
thermo$opt$IAPWS.sat <<- ""
# shows artifactual vapor-liquid transition
water.IAPWS95("V", T, "Psat")
# the calculated Psat, while not exact, should be close enough for most
# geochemical calculations to select liquid or vapor
oldwat <- water("IAPWS95")
thermo$opt$IAPWS.sat <<- "vapor"
V.vapor <- subcrt("water", T=convert(445:455, "C"))$out[[1]]$V
thermo$opt$IAPWS.sat <<- "liquid" # the default
V.liquid <- subcrt("water", T=convert(445:455, "C"))$out[[1]]$V
stopifnot(all(V.vapor > V.liquid))
water(oldwat)



