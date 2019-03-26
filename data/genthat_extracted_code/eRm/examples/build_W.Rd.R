library(eRm)


### Name: build_W
### Title: Automatized Construction of LLRA Design Matrix
### Aliases: build_W build_catdes build_trdes build_effdes get_item_cats

### ** Examples

##An LLRA with 2 treatment groups and 1 baseline group, 5 items and 4
##time points. Item 1 is dichotomous, all others have 3, 4, 5, 6
##categories respectively.
llraDat2a <- matrix(unlist(llraDat2[1:20]),ncol=4)
groupvec <-rep(1:3*5,each=20)
W <- build_W(llraDat2a,nitems=5,mpoints=4,grp_n=c(10,20,40),groupvec=groupvec,itmgrps=1:5)

#There are 55 parameters
dim(W)

## Not run: 
##D #Estimating LLRA by specifiying W
##D ex2W <- LLRA(llraDat2[1:20],W=W,mpoints=4,groups=llraDat2[21])
## End(Not run)



