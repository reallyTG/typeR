library(EvoRAG)


### Name: Profile.like.CI
### Title: Estimate confidence intervals using profile likelihood
### Aliases: Profile.like.CI
### Keywords: confidence interval

### ** Examples

## Not run: 
##D 
##D   ###This example uses the syllable dataset for oscine songbirds Weir & Wheatcroft 2011
##D   data(bird.syllables)
##D   attach(bird.syllables)
##D 
##D   #STEP 1 Correct Euclidean distances for sampling and measurement bias
##D      DIST_cor <- MScorrection(nA=bird.syllables$number_individuals_Species1,
##D         nB=bird.syllables$number_individuals_Species2, 
##D         VarA=bird.syllables$Species1_PC2_var, 
##D         VarB=bird.syllables$Species2_PC2_var, 
##D         DIST_actual=abs(bird.syllables$Species1_PC2_mean - 
##D         bird.syllables$Species2_PC2_mean))
##D 
##D   #STEP 2  Test all models on oscines only (in which song has a strong 
##D   #culturally transmitted component)
##D      DIST <- subset(DIST_cor, subset = (bird.syllables$Suboscine == "oscine"))
##D      TIME <- subset(bird.syllables$TIME,subset = (bird.syllables$Suboscine == "oscine"))
##D      GRAD <- subset(bird.syllables$GRAD, 
##D         subset = (bird.syllables$Suboscine == "oscine"))
##D      FIT5 <- model.test.sisters(DIST=DIST, TIME=TIME, GRAD=GRAD, models=models)
##D      #The best fit model in FIT5 is BM_linear in which tropical species have a 
##D      #much slower rate than temperate species. 
##D 
##D   #STEP 3 run the profile likelihood
##D   Profile.like.CI(DIST=DIST, TIME=TIME, GRAD=GRAD, meserr1 = 0, meserr2 = 0, 
##D      like=FIT5[1,2], par=c(FIT5[5,2], FIT5[6,2]), MODEL="BM_linear", MULT=1, 
##D 	 test.values.par1 = c((0:100)*0.001), test.values.par2 = c((33:100)*0.0001), 
##D 	 p_starting="NULL")
##D 	 
##D   
## End(Not run)#end dontrun



