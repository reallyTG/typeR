## ----setup, include = FALSE, cache = FALSE-------------------------------
require(data.table)
require(gasfluxes)
Sys.setenv(LANG = "C")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", cache = TRUE
)

## ----dataImport, include = TRUE------------------------------------------
library(data.table)
#adjust path (see help("setwd")) and file name as appropriate
fluxMeas <- fread("fluxmeas.csv") 
#here we use two flux measurements from the file as an example
fluxMeas <- fluxMeas[ID %in% c("ID6","ID11")]

fluxMeas

## ----fluxCalculation-----------------------------------------------------
library(gasfluxes)
flux.results <- gasfluxes(fluxMeas, method = c("linear","robust linear", "HMR"), plot = TRUE)
flux.results

## ----fluxSelection-------------------------------------------------------
selectfluxes(flux.results, select = "kappa.max", f.detect = 0.031, t.meas = 1)
flux.results[,c(1,26:30)]

## ----detectionLimitSimulation--------------------------------------------
### estimate f.detect by simulation 
C0    <- 325   #ambient concentration, here in [ppm]
GC.sd <- 5 #uncertainty of GC measurement, here in [ppm]
#create simulated concentrations corresponding to flux measurements with zero fluxes:
set.seed(42)
sim <- data.frame(t = seq(0, 1, length.out = 4), C = rnorm(4e3, mean = C0, sd = GC.sd),
                  id = rep(1:1e3, each = 4), A = 1, V = 0.535125)   # specify your sampling scheme t (here in [h]) and chamber volume (V) and area (A)
#fit HMR model:                  
simflux <- gasfluxes(sim, .id = "id", .times = "t", methods = c("HMR", "linear"), plot = FALSE, verbose = F) 
simflux[, f0 := HMR.f0]
simflux[is.na(f0), f0 := linear.f0] # use linear estimates where HMR could not be fitted
#dection limit as 97.5 % quantile (95 % confidence):
f.detect <- simflux[, quantile(f0, 0.975)]
f.detect # here in [ppm/h/m^2], use same unit as your flux estimates, 
#e.g., convert to mass flux assuming chamber temperature of 15 °C and standard air pressure
f.detect / 1000 * 28 * 273.15 / 22.4 / (273.15 + 15)

