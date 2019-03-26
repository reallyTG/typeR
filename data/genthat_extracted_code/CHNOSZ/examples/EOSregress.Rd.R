library(CHNOSZ)


### Encoding: UTF-8

### Name: EOSregress
### Title: Regress Equations-of-State Parameters for Aqueous Species
### Aliases: EOSregress EOSvar EOScalc EOSplot EOSlab EOScoeffs Cp_s_var
###   V_s_var

### ** Examples

## Don't show: 
data(thermo)
## End(Don't show)
## fit experimental heat capacities of CH4
## using revised Helgeson-Kirkham-Flowers equations
# read the data from Hnědkovský and Wood, 1997
f <- system.file("extdata/cpetc/Cp.CH4.HW97.csv", package="CHNOSZ")
d <- read.csv(f)
# have to convert J to cal and MPa to bar
d$Cp <- convert(d$Cp, "cal")
d$P <- convert(d$P, "bar")
# specify the terms in the HKF equations
var <- c("invTTheta2", "TXBorn")
# perform regression, with a temperature limit
EOSlm <- EOSregress(d, var, T.max=600)
# calculate the Cp at some temperature and pressure
EOScalc(EOSlm$coefficients, 298.15, 1)
# get the database values of c1, c2 and omega for CH4(aq)
CH4coeffs <- EOScoeffs("CH4", "Cp")
## make plots comparing the regressions
## with the accepted EOS parameters of CH4
par(mfrow=c(2,2))
EOSplot(d, T.max=600)
title("Cp of CH4(aq), fit to 600 K")
legend("bottomleft", pch=1, legend="Hnědkovský and Wood, 1997")
EOSplot(d, coefficients=CH4coeffs)
title("Cp from EOS parameters in database")
EOSplot(d, T.max=600, T.plot=600)
title("Cp fit to 600 K, plot to 600 K")
EOSplot(d, coefficients=CH4coeffs, T.plot=600)
title("Cp from EOS parameters in database")

# continuing from above, with user-defined variables
Theta <- 228  # K 
invTTTheta3 <- function(T, P) (2*T)/(T-T*Theta)^3
invTX <- function(T, P) 1/T*water("XBorn", T=T, P=P)[,1]
# print the calculated values of invTTTheta3
EOSvar("invTTTheta3", d$T, d$P)
# use invTTTheta and invTX in a regression
var <- c("invTTTheta3", "invTX")
EOSregress(d, var)
# give them a "label" attribute for use in the legend
attr(invTTTheta3, "label") <-
  quote(phantom()%*%2*italic(T)/(italic(T)-italic(T)*Theta)^3)
attr(invTX, "label") <- quote(phantom()/italic(T*X))
# uncomment the following to make the plot
#EOSplot(d, var)

## model experimental volumes of CH4
## using HKF equation and an exploratory one
f <- system.file("extdata/cpetc/V.CH4.HWM96.csv", package="CHNOSZ")
d <- read.csv(f)
d$P <- convert(d$P, "bar")
# the HKF equation
varHKF <- c("invTTheta", "QBorn")
# alpha is the expansivity coefficient of water
varal <- c("invTTheta", "alpha")
par(mfrow=c(2,2))
# for both HKF and the expansivity equation
# we'll fit up to a temperature limit
EOSplot(d, varHKF, T.max=663, T.plot=625)
legend("bottomright", pch=1, legend="Hnědkovský et al., 1996")
title("V of CH4(aq), HKF equation")
EOSplot(d, varal, T.max=663, T.plot=625)
title("V of CH4(aq), expansivity equation")
EOSplot(d, varHKF, T.max=663)
title("V of CH4(aq), HKF equation")
EOSplot(d, varal, T.max=663)
title("V of CH4(aq), expansivity equation")
# note that the volume regression using the HKF gives
# a result for omega (coefficient on Q) that is
# not consistent with the high-T heat capacities



