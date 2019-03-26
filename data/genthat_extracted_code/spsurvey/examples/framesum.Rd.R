library(spsurvey)


### Name: framesum
### Title: Summarize Frame Size for a Survey Design
### Aliases: framesum
### Keywords: survey

### ** Examples

## Not run: 
##D attframe <- read.dbf("shapefile")
##D design <- list(Stratum1=list(panel=c(PanelOne=50), seltype="Equal", over=10),
##D    Stratum2=list(panel=c(PanelOne=50, PanelTwo=50), seltype="Unequal",
##D    caty.n=c(CatyOne=25, CatyTwo=25, CatyThree=25, CatyFour=25), over=75))
##D framesum(att.frame=attframe, design=design, type.frame="area",
##D    stratum="stratum", mdcaty="mdcaty", auxvar=c("ecoregion",
##D    "state"), units.in="Meters", scale=1000, units.out="Kilometers")
## End(Not run)



