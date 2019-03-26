library(EdSurvey)


### Name: gap
### Title: Gap Analysis
### Aliases: gap

### ** Examples

## Not run: 
##D # read in the example data (generated, not real student data)
##D sdf <- readNAEP(system.file("extdata/data", "M36NT2PM.dat", package = "NAEPprimer"))
##D 
##D # find the mean score gap in the primer data between males and females
##D gap("composite", sdf, dsex=="Male", dsex=="Female")
##D 
##D # find the score gap of the quartiles in the primer data between males and females
##D gap("composite", sdf, dsex=="Male", dsex=="Female", percentile=50)
##D gap("composite", sdf, dsex=="Male", dsex=="Female", percentile=c(25, 50, 75))
##D 
##D # find the percent proficient (or higher) gap in the primer data between males and females
##D gap("composite", sdf, dsex=="Male", dsex=="Female", 
##D     achievementLevel=c("Basic", "Proficient", "Advanced"))
##D 
##D # find the discrete achievement level gap--this is harder to interpret
##D gap("composite", sdf, dsex=="Male", dsex=="Female",
##D     achievementLevel="Proficient", achievementDiscrete=TRUE)
##D 
##D # find the percent talk about studies at home (b017451) never or hardly
##D # ever gap in the primer data between males and females
##D gap("b017451", sdf, dsex=="Male", dsex=="Female", 
##D     targetLevel="Never or hardly ever")
##D 
##D # example showing how to compare multiple levels
##D gap("b017451",sdf, dsex=="Male", dsex=="Female", targetLevel="Infrequently",
##D     recode=list(b017451=list(from=c("Never or hardly ever",
##D                                     "Once every few weeks",
##D                                     "About once a week"),
##D                              to=c("Infrequently"))))
##D 
##D # make subsets of sdf by scrpsu, "Scrambled PSU and school code"
##D sdfA <- subset(sdf, scrpsu %in% c(5,45,56))
##D sdfB <- subset(sdf, scrpsu %in% c(75,76,78))
##D sdfC <- subset(sdf, scrpsu %in% 100:200)
##D sdfD <- subset(sdf, scrpsu %in% 201:300)
##D 
##D sdfl <- edsurvey.data.frame.list(list(sdfA, sdfB, sdfC, sdfD),
##D                                  labels=c("A locations", "B locations",
##D                                           "C locations", "D locations"))
##D 
##D gap("composite", sdfl, dsex=="Male", dsex=="Female", percentile=c(50))
##D 
## End(Not run)



