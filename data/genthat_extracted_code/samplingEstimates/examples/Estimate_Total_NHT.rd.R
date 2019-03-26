library(samplingEstimates)


### Name: Estimate.Total.NHT
### Title: Narain-Horvitz-Thompson estimates for a total from survey data
### Aliases: Estimate.Total.NHT
### Keywords: estimates total strata domains

### ** Examples

##################################
## Setting up data to run examples
##################################
data(Sample1)           ## Loads a data frame with the sample to be used in examples
N         <- 570        ## Defining the population size
## Approximating the 2nd order inclusion probabilities with sample based quantitites
## (Note: this approximation is only suitable for large-entropy sampling designs)
require(samplingVarEst) ## Loading the necessary package
Probs2Mat <- Pkl.Hajek.s(Sample1$InclProbs) ## function from samplingVarEst package
head(Sample1)           ## Showing the first rows of the sample data to be used

############################################################
## Example 1: A variable of interest, without stratification
############################################################
Estimate.Total.NHT(MatY.s   = Sample1$y1     ,
                   VecWk.s  = Sample1$Weights)

Estimate.Total.NHT(MatY.s   = Sample1$y1     ,
                   VecWk.s  = Sample1$Weights,
                   VarEst   = "HT"           )

Estimate.Total.NHT(MatY.s   = Sample1$y1     ,
                   VecWk.s  = Sample1$Weights,
                   VarEst   = "SYG"          ,
                   MatPkl.s = Probs2Mat      )

Estimate.Total.NHT(MatY.s   = Sample1$y1     ,
                   VecWk.s  = Sample1$Weights,
                   VarEst   = "SYG"          ,
                   MatPkl.s = Probs2Mat      ,
                   PopSize  = N              )


###################################################################################
## Example 2: A matrix/dataframe of 2 variables of interest, without stratification
###################################################################################
Estimate.Total.NHT(MatY.s   = Sample1[ ,c("y1","y2")],
                   VecWk.s  = Sample1$Weights        ,
                   VarEst   = "SYG"                  ,
                   MatPkl.s = Probs2Mat              ,
                   PopSize  = N                      )


#########################################################
## Example 3: A variable of interest, with stratification
#########################################################
Estimate.Total.NHT(MatY.s         = Sample1$y1             ,
                   VecWk.s        = Sample1$Weights        ,
                   VecStratLb.s   = Sample1$CharStrataNames,
                   VecStratSize.s = Sample1$StrataSizes    )

Estimate.Total.NHT(MatY.s         = Sample1$y1             ,
                   VecWk.s        = Sample1$Weights        ,
                   VecStratLb.s   = Sample1$CharStrataNames,
                   VecStratSize.s = Sample1$StrataSizes    ,
                   ShowStrata     = TRUE                   )


###############################################################################
## Example 4: A matrix/dataframe (2 variables of interest), with stratification
###############################################################################
Estimate.Total.NHT(MatY.s         = Sample1[ ,c("y1","y2")],
                   VecWk.s        = Sample1$Weights        ,
                   VecStratLb.s   = Sample1$CharStrataNames,
                   VecStratSize.s = Sample1$StrataSizes    ,
                   ShowStrata     = TRUE                   )


#################################################################################
## Example 5: A matrix/dataframe (2 variables), no strata, with unplanned domains
#################################################################################
Estimate.Total.NHT(MatY.s        = Sample1[ ,c("y1","y2")],
                   VecWk.s       = Sample1$Weights        ,
                   VecDomainLb.s = Sample1$CharDoms       )

Estimate.Total.NHT(MatY.s        = Sample1[ ,c("y1","y2")],
                   VecWk.s       = Sample1$Weights        ,
                   VecDomainLb.s = Sample1$NumDoms        )


###################################################################################
## Example 6: A matrix/dataframe (2 variables), with strata, with unplanned domains
###################################################################################
Estimate.Total.NHT(MatY.s         = Sample1[ ,c("y1","y2")],
                   VecWk.s        = Sample1$Weights        ,
                   VecStratLb.s   = Sample1$CharStrataNames,
                   VecStratSize.s = Sample1$StrataSizes    ,
                   ShowStrata     = TRUE                   ,
                   VecDomainLb.s  = Sample1$CharDoms       )



