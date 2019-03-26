library(spsur)


### Name: lmtestspsur
### Title: Testing for the presence of spatial effects in Seemingly
###   Unrelated Regressions
### Aliases: lmtestspsur

### ** Examples


#################################################
######## CROSS SECTION DATA (G>1; Tm=1) # #######
#################################################

#### Example 1: Spatial Phillips-Curve. Anselin (1988, p. 203)
rm(list = ls()) # Clean memory
data("spc")
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA
LMs <- lmtestspsur(Form = Tformula, data = spc, W = Wspc)

## Not run: 
##D #################################################
##D ######## PANEL DATA (G>1; Tm>1)          ########
##D #################################################
##D 
##D #### Example 2: Homicides & Socio-Economics (1960-90)
##D # Homicides and selected socio-economic characteristics for
##D # continental U.S. counties.
##D # Data for four decennial census years: 1960, 1970, 1980 and 1990.
##D # https://geodacenter.github.io/data-and-lab/ncovr/
##D 
##D data("NCOVR")
##D # With different number of exogenous variables in each equation
##D Tformula <- HR70 | HR80  | HR90 ~ PS70 + UE70 | PS80 + UE80 +RD80 |
##D             PS90 + UE90 + RD90 + PO90
##D LMs <- lmtestspsur(Form = Tformula, data = NCOVR, W = W)
## End(Not run)

################################################################
######## PANEL DATA: TEMPORAL CORRELATIONS (G=1; Tm>1) ########
################################################################
## No test: 
#### Example 3: NCOVR in panel data form
## Takes less than 1 minute
data("NCOVR")
Year <- as.numeric(kronecker(c(1960,1970,1980,1990),matrix(1,nrow = dim(NCOVR)[1])))
HR <- c(NCOVR$HR60,NCOVR$HR70,NCOVR$HR80,NCOVR$HR90)
PS <- c(NCOVR$PS60,NCOVR$PS70,NCOVR$PS80,NCOVR$PS90)
UE <- c(NCOVR$UE60,NCOVR$UE70,NCOVR$UE80,NCOVR$UE90)
NCOVRpanel <- as.data.frame(cbind(Year,HR,PS,UE))
Tformula <- HR ~ PS + UE
LM_time <- lmtestspsur(Form = Tformula, data = NCOVRpanel, time = Year, W = W)
## End(No test)




