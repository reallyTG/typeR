library(EvoRAG)


### Name: model.test.sisters
### Title: Fit evolutionary models for continuous trait data
### Aliases: model.test.sisters
### Keywords: Brownian Motion Ornstein Ulhembeck

### ** Examples

## Not run: 
##D ##Example 1
##D   ###This example uses the four models used in Weir et al. 2012 to test for 
##D   ###a latitudinal effect on Euclidean distances for bird song pitch on 87 
##D   ###forest sister pairs.
##D      data(bird.pitch)
##D      attach(bird.pitch)
##D 
##D   #STEP 1 Correct Euclidean distances for sampling and measurement bias
##D      DIST_cor <- MScorrection(nA=bird.pitch$number_individuals_Species1,
##D         nB=bird.pitch$number_individuals_Species2, 
##D         VarA=bird.pitch$Variance_PC1and2_Species1, 
##D         VarB=bird.pitch$Variance_PC1and2_Species2, 
##D         DIST_actual=bird.pitch$Uncorrected_Euclidean_Distance)
##D 
##D   #STEP 2  Extract and test only forest species
##D      DIST <- subset(DIST_cor, subset = (bird.pitch$Habitat == "forest"))
##D      TIME <- subset(bird.pitch$TIME,subset = (bird.pitch$Habitat == "forest"))
##D      GRAD <- subset(bird.pitch$GRAD, 
##D         subset = (bird.pitch$Habitat == "forest"))
##D      models = c("BM_null", "BM_linear", "OU_null", "OU_linear")
##D      #The following generally takes 1 to 2 minutes to run
##D      FIT1 <- model.test.sisters(DIST=DIST, TIME=TIME, GRAD=GRAD, models=models)
##D 
##D   ###The best fit model for forest species is the OU_linear model in which  
##D   ###rates of evolution increase with latitude (b1_slope is positive) and 
##D   ###evolutionary constraint declines with increasing latitude (a1_slope is 
##D   ###negative).High latitude species are evolving faster and in a less 
##D   ###constrained fashion.
##D 
##D ##Example 2
##D   ###This example tests to see if allopatric and sympatric species pairs
##D   ###have significantly different rates under the BM_null model
##D 
##D   #STEP 1  Correct Euclidean distances for sampling and measurement bias
##D      DIST_cor <- MScorrection(nA=bird.pitch$number_individuals_Species1,
##D         nB=bird.pitch$number_individuals_Species2, 
##D         VarA=bird.pitch$Variance_PC1and2_Species1, 
##D         VarB=bird.pitch$Variance_PC1and2_Species2, 
##D             DIST_actual=bird.pitch$Uncorrected_Euclidean_Distance)
##D 
##D   #STEP 2  First, fit BM_linear to the entire dataset
##D      DIST <- DIST_cor
##D      TIME <- bird.pitch$TIME
##D      GRAD <- bird.pitch$GRAD
##D      models = c("BM_null")
##D      FIT2a <- model.test.sisters(DIST=DIST, TIME=TIME, GRAD=GRAD, models=models) 
##D 
##D   #STEP 3  Next, fit BM_linear to the allopatric subset
##D      DIST <- subset(DIST_cor, subset = (bird.pitch$Patry == "allopatric"))
##D      TIME <- subset(bird.pitch$TIME,
##D         subset = (bird.pitch$Patry == "allopatric"))
##D      GRAD <- subset(bird.pitch$GRAD, 
##D         subset = (bird.pitch$Patry == "allopatric"))
##D      models = c("BM_null")
##D      FIT2b <- model.test.sisters(DIST=DIST, TIME=TIME, GRAD=GRAD, models=models) 
##D 
##D   #STEP 4  Finally, fit BM_linear to the sympatric subset
##D      DIST <- subset(DIST_cor, subset = (bird.pitch$Patry == "sympatric"))
##D      TIME <- subset(bird.pitch$TIME,
##D         subset = (bird.pitch$Patry == "sympatric"))
##D      GRAD <- subset(bird.pitch$GRAD, 
##D         subset = (bird.pitch$Patry == "sympatric"))
##D      models = c("BM_null")
##D      FIT2c <- model.test.sisters(DIST=DIST, TIME=TIME, GRAD=GRAD, models=models) 
##D 
##D   #STEP 5  Compare the AIC of the model fit to the entire dataset to the model 
##D   #with separate rates for allopatric and sympatric subsets.
##D      ###To calculate AIC for the allopatric and sympatric model
##D      ###the loglikelihoods for the subsets are summed
##D      logLikelihood <- as.numeric(FIT2b[1,]) + as.numeric(FIT2c[1,]) 
##D      ###The subsets model has 2 parameters (1 for each subset) 
##D      ###thus AIC = 2*2 - 2*logLike
##D      AIC_forest_nonforest <-  2*2 - 2*logLikelihood 
##D      
##D   ###The AIC for the entire dataset is 319.86 and for the model with separate rates 
##D   ###for allopatric and sympatric AIC is 320.13. The best fit model is the full dataset 
##D   ###model without separate rates for different subsets, indicating a failure to reject 
##D   ###the null hypothesis in favour of separate rates for allopatric and sympatric 
##D   ###species pairs.
##D 
##D 
##D ##Example 3
##D   ###using the same data as Example 1, this example demonstrates user control of 
##D   ###starting parameters
##D   #STEP 1  generate matrices of starting values for those models which the user 
##D   #wishes to use customized starting values
##D      p_matrix <- c(0.0001, 0.001, 0.01, 0.1, 1,2,3,4,5,10,100,1000)
##D      BM_null_starting <- matrix(p_matrix, length(p_matrix), 1, byrow=TRUE)
##D 
##D      p_matrix <- c(10, -1, 10, 1, 0, -0.1, 0, 0.1)
##D      BM_linear_starting <- matrix(p_matrix, length(p_matrix)/2, 2, byrow=TRUE)
##D 
##D   #first, use only 2 models, each with customize starting parameters 
##D      models <- c("BM_null", "BM_linear")
##D      FIT3a <- model.test.sisters(DIST=DIST, TIME=TIME, GRAD=GRAD, models=models, 
##D          starting = list(BM_null_starting, BM_linear_starting) )
##D 
##D   #next use 4 models, but customize starting parameters for only the first two 
##D      models <- c("BM_null", "BM_linear", "OU_null", "OU_linear")
##D      FIT3b <- model.test.sisters(DIST=DIST, TIME=TIME, GRAD=GRAD, models=models,
##D          starting = list(BM_null_starting, BM_linear_starting, "NULL", "NULL") )
##D 
##D 
##D ##EXAMPLE 4
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
## End(Not run)#end dontrun



