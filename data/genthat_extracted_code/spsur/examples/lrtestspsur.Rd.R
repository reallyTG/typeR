library(spsur)


### Name: lrtestspsur
### Title: Likelihood Ratio tests for the specification of spatial SUR
###   models.
### Aliases: lrtestspsur

### ** Examples

#################################################
######## CROSS SECTION DATA (nG=1; nT>1) ########
#################################################

#### Example 1: Spatial Phillips-Curve. Anselin (1988, p. 203)
rm(list = ls()) # Clean memory
data("spc")
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA
## It usually requires 1-2 minutes maximum
## LRs <- lrtestspsur(Form = Tformula, data = spc, W = Wspc)

#################################################
######## CROSS SECTION DATA (nG>1; nT=1) ########
#################################################

#### Example 2: Homicides & Socio-Economics (1960-90)
# Homicides and selected socio-economic characteristics for
# continental U.S. counties.
# Data for four decennial census years: 1960, 1970, 1980 and 1990.
# https://geodacenter.github.io/data-and-lab/ncovr/
## No test: 
## It could require some minutes
rm(list = ls()) # Clean memory
data("NCOVR")
Tformula <- HR70 | HR80  | HR90 ~ PS70 + UE70 | PS80 + UE80 + RD80 |
            PS90 + UE90 + RD90 + PO90
LRs <- lrtestspsur(Form = Tformula, data = NCOVR, W = W)
## End(No test)

################################################################
######## PANEL DATA: TEMPORAL CORRELATIONS (nG=1; nT>1) ########
################################################################

#### Example 3: Classic panel data
## No test: 
## It could require some minutes
rm(list = ls()) # Clean memory
data(NCOVR)
N <- nrow(NCOVR)
Tm <- 4
index_time <- rep(1:Tm, each = N)
index_indiv <- rep(1:N, Tm)
pHR <- c(NCOVR$HR60, NCOVR$HR70, NCOVR$HR80, NCOVR$HR90)
pPS <- c(NCOVR$PS60, NCOVR$PS70, NCOVR$PS80, NCOVR$PS90)
pUE <- c(NCOVR$UE60, NCOVR$UE70, NCOVR$UE80, NCOVR$UE90)
pNCOVR <- data.frame(indiv = index_indiv, time = index_time, HR = pHR, PS = pPS, UE = pUE)
rm(NCOVR,pHR,pPS,pUE,index_time,index_indiv)
form_pHR <- HR ~ PS + UE
LRs <- lrtestspsur(Form = form_pHR, data = pNCOVR, W = W, time = pNCOVR$time)
## End(No test)



