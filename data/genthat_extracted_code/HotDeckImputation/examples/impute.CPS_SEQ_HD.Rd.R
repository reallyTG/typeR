library(HotDeckImputation)


### Name: impute.CPS_SEQ_HD
### Title: CPS Sequential Hot-Deck Imputation
### Aliases: impute.CPS_SEQ_HD
### Keywords: NA manip optimize multivariate impute

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)

n<-1000
m<-3
pmiss<-.1

#Generate matrix of random integers and 2 binary covariates
Y<-cbind(matrix(sample(0:1,replace=TRUE,size=n*2),nrow=n),
		 matrix(sample(0:9,replace=TRUE,size=n*m),nrow=n))

#generate missing values, MCAR, in all but the first two columns
Y[,-c(1,2)][sample(1:length(Y[,-c(1,2)]),
				   size=floor(pmiss*length(Y[,-c(1,2)])))]<-NA

#perform the sequential imputation Y within the 
#classes created by cross-classifying variables 1 and 2
impute.CPS_SEQ_HD(DATA=Y,covariates=c(1,2),initialvalues=0, navalues=NA, modifyinplace = FALSE)


####an example highlighting the modifyinplace option
#using cbind to show the results of the function and the intial data next to another
cbind(impute.CPS_SEQ_HD(DATA=Y,covariates=c(1,2),initialvalues=0,
                        navalues=NA, modifyinplace = FALSE),Y)
#notice that columns 8-10 (representing Y) still have missing data

#same procedure, except modifyinplace is set to TRUE
cbind(impute.CPS_SEQ_HD(DATA=Y,covariates=c(1,2),initialvalues=0,
                        navalues=NA, modifyinplace = TRUE),Y)
#notice that columns 8-10 (representing Y) are identical to columns 3-5, 
#Y has (and any Variables pointing to the same object have) been directly modified.



