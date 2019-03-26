## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library("EDA")
# load data
data("carbon")
data("energy")
data("buildingarea")
head(carbon)[1:3,]

## ---- eval = FALSE-------------------------------------------------------
#  # calculate factors data
#  ## Factor 1: Emission-factor effect (EF)
#  cdata <- carbon[,-c(1,2)]
#  edata <- energy[,-c(1,2)]
#  Sector <- c("b1", "b2", "b3")
#  xdata1 <- cdata/edata
#  ## Factor 2: Energy-mix effect (EM)
#  Esum <- aggregate(edata, by=list(energy[,1]), FUN=sum, na.rm = TRUE)[,-1]
#  Esum <- Esum[rep(seq_len(nrow(Esum)), length(Sector)), ]
#  xdata2 <- edata/Esum
#  ## Factor 3: Intensity effect (IE)
#  e_yearsum <- rowSums(Esum)
#  xdata3 <- Esum/e_yearsum
#  ## Factor 4: Energy consumption density effect (DE)
#  area <- rep(buildingarea[,2], length(Sector))
#  xdata4 <- e_yearsum/area
#  xdata4 <- as.data.frame(xdata4)
#  ## Factor 5: Area effect (AE)
#  xdata5 <- as.data.frame(area)
#  ## list of factors
#  factordata <- list(xdata1, xdata2, xdata3, xdata4, xdata5)
#  names(factordata) <- c("EF","EM","IE","DE","AE")

## ------------------------------------------------------------------------
data(carbon)
data(factordata)
## set parameters
cdata <- carbon[,-c(1,2)]
C0 <- cdata[1,]
CT <- cdata[2,]
X0 <- factordata[[2]][1,]
XT <- factordata[[2]][2,]
## run LMDI model
ed1 <- LMDI(C0, CT, X0, XT)
ed1

## ------------------------------------------------------------------------
data(carbon)
data(factordata)
## set parameters
cdata <- carbon[,-c(1,2)]
Year <- 2001:2005
Sector <- c("b1", "b2", "b3")
Fuel <- colnames(cdata)
Factor <- names(factordata)
## run EDA model
eda1 <- EDA(cdata, factordata, Year = Year, Factor = Factor, 
    Fuel = Fuel, Sector = Sector, method = "LMDI")
eda1
plot(eda1)

