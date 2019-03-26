library(spsur)


### Name: wald_betas
### Title: Wald tests on the _beta_ coefficients of the equation of the SUR
###   model
### Aliases: wald_betas

### ** Examples


#################################################
######## CROSS SECTION DATA (G=1; Tm>1) ########
#################################################

#### Example 1: Spatial Phillips-Curve. Anselin (1988, p. 203)
rm(list = ls()) # Clean memory
data(spc)
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA
## Estimate SUR-SLM model
spcsur.slm <- spsur3sls(Form = Tformula, data = spc, type = "slm", W = Wspc)
summary(spcsur.slm)
## H_0: equality between SMSA coefficients in both equations.
R1 <- matrix(c(0,0,0,1,0,0,0,-1), nrow=1)
b1 <- matrix(0, ncol=1)
Wald_beta <- wald_betas(results = spcsur.slm, R = R1, b = b1)

## H_0: equality between intercepts and SMSA coefficients in both equations.
R2 <- matrix(c(1,0,0,0,-1,0,0,0,0,0,0,1,0,0,0,-1),
             nrow = 2, ncol = 8, byrow = TRUE)
b2 <- matrix(c(0,0),ncol=1)
wald_betas(results = spcsur.slm, R = R2, b = b2)
####################################
########  G=1; Tm>1         ########
####################################

#### Example 2: Homicides + Socio-Economics (1960-90)
## No test: 
## Usually takes 1-2 minutes maximum
data(NCOVR)
Tformula <- HR80  | HR90 ~ PS80 + UE80 | PS90 + UE90
#################################
## A SUR-SLM model
NCOVRSUR.slm <-spsurml(Form = Tformula, data = NCOVR, type = "slm", W = W)
summary(NCOVRSUR.slm)
R1 <- matrix(c(0,1,0,0,-1,0), nrow=1)
b1 <- matrix(0, ncol=1)
wald_betas(results = NCOVRSUR.slm, R = R1, b = b1)
## End(No test)



