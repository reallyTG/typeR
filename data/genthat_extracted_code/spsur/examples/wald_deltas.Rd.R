library(spsur)


### Name: wald_deltas
### Title: Wald tests for spatial parameters coefficients.
### Aliases: wald_deltas

### ** Examples


#################################################
######## CROSS SECTION DATA (G>1; Tm=1) ########
#################################################
rm(list = ls()) # Clean memory
data(spc)
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA

#################################
## Estimate SUR-SLM model
spcsur.slm <-spsur3sls(Form = Tformula, data = spc, type = "slm", W= Wspc)
summary(spcsur.slm)
## H_0: equality of the lambda parameters of both equations.
R1 <- matrix(c(1,-1), nrow=1)
b1 <- matrix(0, ncol=1)
wald_deltas(results = spcsur.slm, R = R1, b = b1)
## No test: 
#################################
## Estimate SUR-SEM model
#' ## It usually requires 1-2 minutes maximum
spcsur.sem <-spsurml(Form = Tformula, data = spc, type = "sem", W = Wspc)
summary(spcsur.sem)
## H_0: equality of the rho parameters of both equations.
R2 <- matrix(c(1,-1), nrow=1)
b2 <- matrix(0, ncol=1)
wald_deltas(results = spcsur.sem, R = R2, b = b2)

#################################
## Estimate SUR-SARAR model
## It usually requires 2-3 minutes maximum
spcsur.sarar <-spsurml(Form = Tformula, data = spc,
                       type = "sarar", W = Wspc)
summary(spcsur.sarar)
## H_0: equality of the lambda and rho parameters of both equations.
R3 <- matrix(c(1,-1,0,0,0,0,1,-1),nrow=2,ncol=4,byrow=TRUE)
b3 <- matrix(c(0,0), ncol=1)
wald_deltas(results = spcsur.sarar, R = R3, b = b3)

####################################
########  G=1; Tm>1         ########
####################################

#' #### Example 2: Homicides + Socio-Economics (1960-90)
#' # It could make an error out-of-memory in some computers
rm(list = ls()) # Clean memory
data(NCOVR)
Tformula <- HR80  | HR90 ~ PS80 + UE80 | PS90 + UE90

#################################
## A SUR-SLM model
NCOVRSUR.slm <-spsurml(Form = Tformula, data = NCOVR, type = "slm", W = W)
summary(NCOVRSUR.slm)
## H_0: equality of the lambda parameters of both equations.
R1 <- matrix(c(1,-1), nrow=1)
b1 <- matrix(0, ncol=1)
wald_deltas(results = NCOVRSUR.slm, R = R1, b = b1)

#################################
## Estimate SUR-SEM model
NCOVRSUR.sem <-spsurml(Form = Tformula, data = NCOVR, type = "sem", W = W)
summary(NCOVRSUR.sem)
## H_0: equality of the rho parameters of both equations.
R2 <- matrix(c(1,-1), nrow=1)
b2 <- matrix(0, ncol=1)
wald_deltas(results = NCOVRSUR.sem, R = R2, b = b2)
## End(No test)



