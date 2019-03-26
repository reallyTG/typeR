library(MBESS)


### Name: ss.power.rc
### Title: sample size for a targeted regression coefficient
### Aliases: ss.power.rc
### Keywords: design

### ** Examples

Cor.Mat <- rbind(
c(1.00, 0.53,  0.58, 0.60, 0.46, 0.66),
c(0.53, 1.00,  0.35, 0.07, 0.14, 0.43),
c(0.58, 0.35,  1.00, 0.18, 0.29, 0.50),
c(0.60, 0.07,  0.18, 1.00, 0.30, 0.26),
c(0.46, 0.14,  0.29, 0.30, 1.00, 0.30),
c(0.66, 0.43,  0.50, 0.26, 0.30, 1.00))

RHO.XX <- Cor.Mat[2:6,2:6]
Rho.YX <- Cor.Mat[1,2:6]

# Method 1
# ss.power.rc(Rho2.Y_X=0.7826786, Rho2.Y_X.without.k=0.7363697, K=5,
# alpha.level=.05, Directional=FALSE, desired.power=.80)

# Method 2
# ss.power.rc(alpha.level=.05, RHO.XX=RHO.XX, Rho.YX=Rho.YX, 
# which.predictor=5, Directional=FALSE, desired.power=.80)

# Method 3
# Here, beta.j is the standardized regression coefficient. Had beta.j 
# been the unstandardized regression coefficient, sigma.X and sigma.Y 
# would have been the standard deviation for the 
# X variable of interest and Y, respectively.
# ss.power.rc(Rho2.Y_X=0.7826786, Rho2.k_X.without.k=0.3652136, 
# beta.k=0.2700964, K=5, alpha.level=.05,  sigma.X=1, sigma.Y=1, 
# Directional=FALSE, desired.power=.80)

# Method 4
# ss.power.rc(alpha.level=.05, Cohen.f2=0.2130898, K=5, 
# Directional=FALSE, desired.power=.80)

# Power given a specified N and squared multiple correlation coefficients.
# ss.power.rc(Rho2.Y_X=0.7826786, Rho2.Y_X.without.k=0.7363697, 
# Specified.N=25, K=5, alpha.level=.05, Directional=FALSE)

# Power given a specified N and effect size.
# ss.power.rc(alpha.level=.05, Cohen.f2=0.2130898, K=5, Specified.N=25,
# Directional=FALSE)

# Reproducing Maxwell's (2000, p. 445) Example
Cor.Mat.Maxwell <- rbind(
c(1.00, 0.35,  0.20, 0.20, 0.20, 0.20),
c(0.35, 1.00,  0.40, 0.40, 0.40, 0.40),
c(0.20, 0.40,  1.00, 0.45, 0.45, 0.45),
c(0.20, 0.40,  0.45, 1.00, 0.45, 0.45),
c(0.20, 0.40,  0.45, 0.45, 1.00, 0.45),
c(0.20, 0.40,  0.45, 0.45, 0.45, 1.00))

RHO.XX.Maxwell <- Cor.Mat.Maxwell[2:6,2:6]
Rho.YX.Maxwell <- Cor.Mat.Maxwell[1,2:6]
R2.Maxwell <- Rho.YX.Maxwell

RHO.XX.Maxwell.no.1 <- Cor.Mat.Maxwell[3:6,3:6]
Rho.YX.Maxwell.no.1 <- Cor.Mat.Maxwell[1,3:6]
R2.Maxwell.no.1 <- 
Rho.YX.Maxwell.no.1


# Note that Maxwell arrives at N=113, whereas this procedure arrives at 111.
# This seems to be the case becuase of rounding error in calculations 
# and tables (Cohen, 1988) used. The present procedure is correct and 
# contains no rounding error in the application of the method.
# ss.power.rc(Rho2.Y_X=R2.Maxwell, Rho2.Y_X.without.k=R2.Maxwell.no.1, K=5,
# alpha.level=.05, Directional=FALSE, desired.power=.80)



