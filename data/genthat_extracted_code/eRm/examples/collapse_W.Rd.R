library(eRm)


### Name: collapse_W
### Title: Convenient Collapsing of LLRA Design Matrix
### Aliases: collapse_W

### ** Examples

##An LLRA with 2 treatment groups and 1 baseline group, 5 items and 4
##time points. Item 1 is dichotomous, all others have 3, 4, 5, 6
##categories respectively.    
llraDat2a <- matrix(unlist(llraDat2[1:20]),ncol=4)
groupvec <-rep(1:3*5,each=20)
W <- build_W(llraDat2a, nitems=5, mpoints=4, grp_n=c(10,20,40), groupvec=groupvec,itmgrps=1:5)

#There are 55 parameters to be estimated
dim(W)

#Imposing a linear trend for the second item ,i.e. parameters in
#columns 32, 37  and 42 need to be collapsed into a single column. 
collItems1 <- list(c(32,37,42))
newNames1 <- c("trend.I2")
Wstar1 <- collapse_W(W,collItems1)

#53 parameters need to be estimated
dim(Wstar1)



