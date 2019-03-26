library(EdSurvey)


### Name: edsurvey.data.frame.list
### Title: EdSurvey Dataset Vectorization
### Aliases: edsurvey.data.frame.list append.edsurvey.data.frame.list

### ** Examples

# read in the example data (generated, not real student data)
sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package="NAEPprimer"))

# NOTE: the following code would not normally have to be run but is used here
# to generate demo data.
# Specifically, make subsets of sdf by the scrpsu variable,
# "Scrambled PSU and school code"
sdfA <- subset(sdf, scrpsu %in% c(5,45,56))
sdfB <- subset(sdf, scrpsu %in% c(75,76,78))
sdfC <- subset(sdf, scrpsu %in% 100:200)
sdfD <- subset(sdf, scrpsu %in% 201:300)

# construct an edsurvey.data.frame.list from these four data sets
sdfl <- edsurvey.data.frame.list(list(sdfA, sdfB, sdfC, sdfD),
                                 labels=c("A locations",
                                          "B locations",
                                          "C locations",
                                          "D locations"))


# this shows how these datasets will be described
sdfl$covs 
## Not run: 
##D # get the gaps between Male and Female for each data set
##D gap1 <- gap("composite", sdfl, dsex=="Male", dsex=="Female")
##D gap1
## End(Not run)

# make combine sdfA and sdfB
sdfl1a <- edsurvey.data.frame.list(list(sdfA, sdfB),
                                   labels=c("A locations",
                                            "B locations"))

# combine sdfC and sdfD
sdfl1b <- edsurvey.data.frame.list(list(sdfC, sdfD),
                                   labels=c("C locations",
                                            "D locations"))

# append to make sdf3 the same as sdfl
sdfl3 <- append.edsurvey.data.frame.list(sdfl1a, sdfl1b)
identical(sdfl, sdfl3) #TRUE

# append to make sdf4 the same as sdfl
sdfl4 <- append.edsurvey.data.frame.list(
  append.edsurvey.data.frame.list(sdfl1a, sdfC, labelsB = "C locations"),
  sdfD,
  labelsB = "D locations")
identical(sdfl, sdfl4) #TRUE




