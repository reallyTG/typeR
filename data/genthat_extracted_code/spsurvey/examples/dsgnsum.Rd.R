library(spsurvey)


### Name: dsgnsum
### Title: Summarize the Sites Selected for a Survey Design
### Aliases: dsgnsum
### Keywords: survey

### ** Examples

## Not run: 
##D design <- list(Stratum1=list(panel=c(PanelOne=50), seltype="Equal", over=10),
##D    Stratum2=list(panel=c(PanelOne=50, PanelTwo=50), seltype="Unequal",
##D    caty.n=c(CatyOne=25, CatyTwo=25, CatyThree=25, CatyFour=25), over=75))
##D attframe <- read.dbf("shapefile")
##D samp <- grts(design=design, DesignID="Test.Site", type.frame="area",
##D    src.frame="shapefile", in.shape="shapefile", att.frame=attframe,
##D    stratum="stratum", mdcaty="mdcaty", shapefile=TRUE,
##D    shapefilename="sample")
##D dsgnsum(samp, auxvar=c("ecoregion", "state"))
## End(Not run)



