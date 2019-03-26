library(spsur)


### Name: spsur3sls
### Title: Three Stages Least Squares estimation,3sls, of spatial SUR
###   models.
### Aliases: spsur3sls

### ** Examples


#################################################
######## CROSS SECTION DATA (G=1; Tm>1) ########
#################################################

#### Example 1: Spatial Phillips-Curve. Anselin (1988, p. 203)
## A SUR model without spatial effects
rm(list = ls()) # Clean memory
data(spc)
Tformula <- WAGE83 | WAGE81 ~ UN83 + NMR83 + SMSA | UN80 + NMR80 + SMSA

## A SUR-SLM model (3SLS Estimation)
spcsur.slm.3sls <-spsur3sls(Form = Tformula, data = spc,
                            type = "slm", W = Wspc)
summary(spcsur.slm.3sls)

## A SUR-SDM model (3SLS Estimation)
spcsur.sdm.3sls <-spsur3sls(Form = Tformula, data = spc,
                            type = "sdm", W = Wspc)
summary(spcsur.sdm.3sls)

#################################################
######## PANEL DATA (G>1; Tm>1)         #########
#################################################

#### Example 2: Homicides + Socio-Economics (1960-90)
# Homicides and selected socio-economic characteristics for continental
# U.S. counties.
# Data for four decennial census years: 1960, 1970, 1980 and 1990.
# https://geodacenter.github.io/data-and-lab/ncovr/
rm(list = ls()) # Clean memory
data(NCOVR)
Tformula <- HR80  | HR90 ~ PS80 + UE80 | PS90 + UE90

## A SUR-SLR model
NCOVRSUR.slm.3sls <-spsur3sls(Form = Tformula, data = NCOVR, type = "slm",
                            W = W, maxlagW = 2)
summary(NCOVRSUR.slm.3sls)




