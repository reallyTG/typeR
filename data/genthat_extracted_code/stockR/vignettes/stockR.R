## ----prelim, echo = FALSE, results="hide"--------------------------------
library( knitr)
opts_chunk$set(cache=TRUE, message = FALSE, comment = "", dev="pdf",
                      dpi=300, fig.show = "hold", fig.align = "center")

## ----setup1, eval=FALSE--------------------------------------------------
#  install.packages( "stockR")

## ----setup2--------------------------------------------------------------
library( stockR)

## ----setSeed-------------------------------------------------------------
set.seed( 747)  #a 747 is a big plane

## ----simData-------------------------------------------------------------
#number of individuals
N <- 100
#number of markers to measure on each of the individuals
M <- 5000
#number of sampling groups (same as number of individuals)
S <- N
#number of stocks
K <- 3
#simulate the data
myData <- sim.stock.data( nAnimal=N, nSNP=M, nSampleGrps=N, K=K)

## ----lookAtData----------------------------------------------------------
#the dimensions of the data
dim( myData)
#the number of fish
ncol( myData)
#the number of markers
nrow( myData)
#summary of the stock sizes
table( attributes( myData)$grps)
#the individuals are ordered by stock membership
attributes( myData)$grps
#in this case the third stock is under-represented in the entire data set. On
#average, there will be equal numbers though.

## ----lookAtData2---------------------------------------------------------
#a quick look at the data -- first 5 markers and 3 individuals
myData[1:5,1:3]
#so, all individuals have two allele copies (homozygous) for the third loci
#the second fish is heterozygous for the allele at the first loci.
#and so on.

## ----findStocks----------------------------------------------------------
#find the stocks in the data
stocks <- stockSTRUCTURE( myData, K=3)  #K-EM estimation is default
#the (posterior) membership probability to each stock
stocks$postProb #shows high discrimination, which could be erroneous (bootstrap soon)
#hard classificaiton of individuals to stocks
stocks$hardClass <- apply( stocks$postProb, 1, which.max)
#Bootstrap to see about uncertainty in assignment
#for serious applications many more than B=25 will be needed.
#only 2 cores used to pass CRAN's arbitrary checks
stocks$boot <- stockBOOT( stocks, B=25, mc.cores=2)  
#Assignment accounting for uncertainty. 
#Could also look at other model quantities (e.g. allele frequencties)
stocks$uncertClass <- apply( stocks$boot$postProbs, 1:2, quantile, probs=c(0.05,0.5,0.95))
#careful inspection of this object will give the lower and upper 90% confidence intervals and the median
#e.g. for the 99th individual
print( round( stocks$uncertClass[,99,], 3))
#showing that there is some uncertainty about which stock this indivudal belongs to.

## ----sampGrps------------------------------------------------------------
#number of sampling groups (same as number of individuals)
S <- 15   #there are now 15 sampling groups (100 individuals will be 
	#distributed between them).
#number of stocks
K <- 3
#simulate the data
myData <- sim.stock.data( nAnimal=N, nSNP=M, nSampleGrps=S, K=K)
#find stocks in data
stocks <- stockSTRUCTURE( myData, K=3, 
			sample.grps=attributes(myData)$sampleGrps)
#once again, the stocks have been found (up to labelling)
#the simulated values
attributes( myData)$grps
#the data-derived values (as hard clustered)
apply( stocks$postProbs, 1, which.max)
#Bootstrap to see about uncertainty in assignment
#for serious applications many more than B=25 will be needed.
#only 2 cores used to pass CRAN's arbitrary checks
stocks$boot <- stockBOOT( stocks, B=25, mc.cores=2)  
#Assignment accounting for uncertainty. 
#Could also look at other model quantities (e.g. allele frequencties)
stocks$uncertClass <- apply( stocks$boot$postProbs, 1:2, quantile, probs=c(0.05,0.5,0.95))
#careful inspection of this object will give the lower and upper 90% confidence intervals and the median
#e.g. for the 99th individual
print( round( stocks$uncertClass, 3))
#Showing that there is almost no uncertainty about which stock this indivudal belongs to.
#There is lots of information in this data, especially when genetic information between 
#individuals in the same sampling group is utilised.

## ----miss----------------------------------------------------------------
myData <- sim.stock.data( nAnimal=N, nSNP=M, nSampleGrps=N, K=K)
#add some missing data to simulation. There are 30% randomly missing scores.
totMark <- prod( dim( myData))
myData[sample( 1:totMark, size=floor( 0.3*totMark))] <- NA
#find stocks in data
stocks <- stockSTRUCTURE( myData, K=3)
#once again, the stocks have been found (up to labelling)
#the simulated values
attributes( myData)$grps
#the data-derived values (as hard clustered)
apply( stocks$postProbs, 1, which.max)
#bootstrap not performed for this example

## ----Tidy----------------------------------------------------------------
#tidy
rm( list=ls())

## ----sessionInfo, results = "asis", echo = FALSE-------------------------
toLatex(sessionInfo())

