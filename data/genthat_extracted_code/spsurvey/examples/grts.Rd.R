library(spsurvey)


### Name: grts
### Title: Generalized Random-Tessellation Stratified (GRTS) Survey Design
### Aliases: grts
### Keywords: survey

### ** Examples

## Not run: 
##D The following example will select a sample from an area resource.  The design
##D includes two strata.  For Stratum 1, an equal probability sample of size 50
##D will be selected for a single panel.  For Stratum 2, an unequal probability
##D sample of size 50 will be selected for each of two panels.  The sample for
##D Stratum 2 will be approportioned into samples of size 25 for each of four
##D unequal probability categories.  In addition both strata will include
##D oversamples (size 10 for Stratum 1 and size 75 for Stratum 2).  It is assumed
##D that a shapefile defining the polygons for the area resource is located in the
##D folder from which R is started.  Attribute data for the design will be read
##D from the dbf file of the shapefile, which is assumed to have variables named
##D "test.stratum" and "test.mdcaty" that specify stratum membership value and
##D unequal probability category, respectively, for each record in the shapefile.
##D A shapefile named "test.sample" containing the survey design information will
##D be created.
##D test.design <- list("Stratum 1"=list(panel=c(Panel=50), seltype="Equal",
##D    over=10), "Stratum 2"=list(panel=c("Panel One"=50, "Panel Two"=50),
##D    seltype="Unequal", caty.n=c(CatyOne=25, CatyTwo=25, CatyThree=25,
##D    CatyFour=25), over=75))
##D test.attframe <- read.dbf("test.shapefile")
##D test.sample <- grts(design=test.design, DesignID="Test.Site", type.frame="area",
##D    src.frame="shapefile", in.shape="test.shapefile", att.frame=test.attframe,
##D    stratum="test.stratum", mdcaty="test.mdcaty", shapefile=TRUE,
##D    out.shape="test.sample")
## End(Not run)



