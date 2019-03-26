library(flars)


### Name: flars
### Title: Functional least angle regression.
### Aliases: flars

### ** Examples

library(flars)
library(fda)
#### Ex1 ####
## Generate some data.
dataL=data_generation(seed = 1,uncorr = TRUE,nVar = 8,nsamples = 120,
    var_type = 'm',cor_type = 3)

## Do the variable selection
out=flars(dataL$x,dataL$y,method='basis',max_selection=9,
    normalize='norm',lasso=FALSE)

## Check the stopping point with CD
plot(2:length(out$alpha),out$CD) # plot the CD with the iteration number

## In simple problems we can try
(iter=which.max(diff(out$CD))+2)


#### Ex2 ####
## Generate some data.
# dataL=data_generation(seed = 1,uncorr = FALSE,nVar = 8,nsamples = 120,
#      var_type = 'm',cor_type = 3)
## add more variables to the candidate
# for(i in 2:4){
# dataL0=data_generation(seed = i,uncorr = FALSE,nVar = 8,nsamples = 120,
#      var_type = 'm',cor_type = 3) 
# dataL$x=c(dataL$x,dataL0$x)
# }
# names(dataL$x)=paste0('v_',seq(length(dataL$x)))

## Do the variable selection
# out=flars(dataL$x,dataL$y,method='basis',max_selection=9,
#     normalize='norm',lasso=FALSE)

#### Ex3 (small subset of a real data set) ####
data(RealDa, package = 'flars')
out=flars(RealDa$x,RealDa$y,method='basis',max_selection=9,
    normalize='norm',lasso=FALSE)
# out=flars(RealDa$x,RealDa$y,method='basis',max_selection=9,
#     normalize='norm',lasso=TRUE)

## Check the stopping point with CD
plot(2:length(out$alpha),out$CD) # plot the CD with the iteration number
## The value drops to very small compare to others at iteration six and 
###  stays low after that, so the algorithm may stop there. 





