library(HotDeckImputation)


### Name: impute.SEQ_HD
### Title: Sequential Hot-Deck Imputation
### Aliases: impute.SEQ_HD
### Keywords: NA manip optimize multivariate impute

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)

n<-1000
m<-5
pmiss<-.1


#Generate matrix of random integers
Y<-matrix(sample(0:9,replace=TRUE,size=n*m),nrow=n)

#generate 6 missing values, MCAR, in all but the first row
Y[-1,][sample(1:length(Y[-1,]),size=floor(pmiss*length(Y[-1,])))]<-NA

#perform the sequential imputation Y
impute.SEQ_HD(DATA=Y,initialvalues=0, navalues=NA, modifyinplace = FALSE)

####an example highlighting the modifyinplace option
#using cbind to show the results of the function and the intial data next to another
cbind(impute.SEQ_HD(DATA=Y,initialvalues=0, navalues=NA, modifyinplace = FALSE),Y)
#notice that columns 6-10 (representing Y) still have missing data

#same procedure, except modifyinplace is set to TRUE
cbind(impute.SEQ_HD(DATA=Y,initialvalues=0, navalues=NA, modifyinplace = TRUE),Y)
#notice that columns 6-10 (representing Y) are identical to columns 1-5, 
#Y has (and any Variables pointing to the same object have) been directly modified.




