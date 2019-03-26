library(spsurvey)


### Name: irs
### Title: Independent Random Sample (IRS) Survey Design
### Aliases: irs
### Keywords: survey

### ** Examples

## Not run: 
##D # The following example will select a sample from an area resource.  The design
##D # includes two strata.  For Stratum 1, a sample of size 50 will be selected for
##D # a single panel.  For Stratum 2, a sample of size 50 will be selected for each
##D # of two panels.  In addition both strata will include oversamples (size 10 for
##D # Stratum 1 and size 75 for Stratum 2).  It is assumed that a shapefile defining
##D # the polygons for the area resource is located in the folder from which R is
##D # started.  Attribute data for the design will be read from the dbf file of the
##D # shapefile, which is assumed to have a variable named "test.stratum" that
##D # specifies stratum membership value for each record in the shapefile. A
##D # shapefile named "test.sample" containing the survey design information will be
##D # created.
##D test.design <- list("Stratum 1"=list(panel=c(Panel=50), seltype="Equal",
##D    over=10), "Stratum 2"=list(panel=c("Panel One"=50, "Panel Two"=50),
##D    seltype="Unequal", caty.n=c(CatyOne=25, CatyTwo=25, CatyThree=25,
##D    CatyFour=25), over=75))
##D test.attframe <- read.dbf("test.shapefile")
##D test.sample <- irs(design=test.design, DesignID="Test.Site", type.frame="area",
##D    src.frame="shapefile", in.shape="test.shapefile", att.frame=test.attframe,
##D    stratum="test.stratum", mdcaty="test.mdcaty", shapefile=TRUE,
##D    out.shape="test.sample")
## End(Not run)



