library(OriGen)


### Name: RankSNPsLRT
### Title: Rank the SNPs based on the likelihood ratio test.
### Aliases: RankSNPsLRT
### Keywords: SNP Ranking Likelihood Information

### ** Examples


#Data generation
SampleSites=25
NumberSNPs=10
TestData=array(sample(2*(1:30),2*SampleSites*NumberSNPs,replace=TRUE),
	dim=c(2,SampleSites,NumberSNPs))
#Europe is about -9 to 38 and 34 to 60
TestCoordinates=array(0,dim=c(SampleSites,2))
TestCoordinates[,1]=runif(SampleSites,-9,38)
TestCoordinates[,2]=runif(SampleSites,34,60)

#This code simulates the number of major alleles the unknown individuals have.
NumberUnknowns=2
TestUnknowns=array(sample(0:2,NumberUnknowns*NumberSNPs,replace=TRUE),
	dim=c(NumberUnknowns,NumberSNPs))

#Rank the SNPs
trials7=RankSNPsLRT(TestData)
trials7




