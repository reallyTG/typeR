## ----Environmental variables---------------------------------------------
library(SSDM)
Env <- load_var(system.file('extdata',  package = 'SSDM'), categorical = 'SUBSTRATE', verbose = FALSE)
Env

## ----Natural history records---------------------------------------------
Occ <- load_occ(path = system.file('extdata',  package = 'SSDM'), Env,
         Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
         file = 'Occurrences.csv', sep = ',', verbose = FALSE)
head(Occ)

## ----SDM-----------------------------------------------------------------
SDM <- modelling('GLM', subset(Occurrences, Occurrences$SPECIES == 'elliptica'), 
                 Env, Xcol = 'LONGITUDE', Ycol = 'LATITUDE', verbose = FALSE)
plot(SDM@projection, main = 'SDM\nfor Cryptocarya elliptica\nwith GLM algorithm')

## ----ESDM----------------------------------------------------------------
ESDM <- ensemble_modelling(c('CTA', 'MARS'), subset(Occurrences, Occurrences$SPECIES == 'elliptica'),
                           Env, rep = 1, Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
                          ensemble.thresh = c(0.6), verbose = FALSE)
plot(ESDM@projection, main = 'ESDM\nfor Cryptocarya elliptica\nwith CTA and MARS algorithms')

## ----SSDM----------------------------------------------------------------
SSDM <- stack_modelling(c('CTA', 'SVM'), Occurrences, Env, rep = 1,
                       Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
                       Spcol = 'SPECIES', method = "pSSDM", verbose = FALSE)
plot(SSDM@diversity.map, main = 'SSDM\nfor Cryptocarya genus\nwith CTA and SVM algorithms')

## ----SDM evaluation------------------------------------------------------
knitr::kable(ESDM@evaluation)

## ----SSDM evaluation-----------------------------------------------------
knitr::kable(SSDM@evaluation)

## ----SSDM variable importance--------------------------------------------
knitr::kable(SSDM@variable.importance)

## ----SSDM endemism-------------------------------------------------------
plot(SSDM@endemism.map, main = 'Endemism map\nfor Cryptocarya genus\nwith CTA and SVM algorithms')

## ----plot----------------------------------------------------------------
# plot(SSDM)

