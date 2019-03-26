library(OriGen)


### Name: CalcFractionsMultiLoglik
### Title: Calculates the loglikelihood for placing a sample 100 percent
###   back into its own sample site
### Aliases: CalcFractionsMultiLoglik
### Keywords: Localization Ancestry Admixture

### ** Examples


#Data generation
NumberUnknowns = 50
NumberLoci = 10
TestUnknownDataArray=array(sample(1:5,2*NumberUnknowns*NumberLoci,replace=TRUE)
	,dim=c(NumberUnknowns,2,NumberLoci))

CalcFractionsMultiLoglik(TestUnknownDataArray)






