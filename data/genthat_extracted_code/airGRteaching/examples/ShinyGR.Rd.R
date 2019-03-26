library(airGRteaching)


### Name: ShinyGR
### Title: Interactive Web application to run manually the GR4J, GR5 and
###   GR6J hydrological models with or without CemaNeige
### Aliases: ShinyGR

### ** Examples

library(airGR)

## data.frame of observed data of a low-land basin
data(L0123001)
BV_L0123001 <- BasinObs[0001:6000, c("DatesR", "P", "E", "Qmm", "T")]
BI_L0123001 <- BasinInfo

## data.frame of observed data of a mountainous basin
data(L0123002)
BV_L0123002 <- BasinObs[5000:9999, c("DatesR", "P", "E", "Qmm", "T")]
BI_L0123002 <- BasinInfo

## Interactive simulation step using default parameters
## No test: 
if (interactive()) {
  ShinyGR(ObsDF = list("Low-land basin" = BV_L0123001, "Mountainous basin" = BV_L0123002),
          ZInputs = list(NULL, median(BI_L0123002$HypsoData)),
          HypsoData = list(NULL, BI_L0123002$HypsoData),
          NLayers = list(5, 5),
          SimPer = list(c("1994-01-01", "1998-12-31"), c("2004-01-01", "2006-12-31")),
          theme = "United")
}
## End(No test)



