library(generalCorr)


### Name: PanelLag
### Title: Function for computing a vector of one-lagged values of xj, a
###   variable from panel data.
### Aliases: PanelLag

### ** Examples


## Not run: 
##D indiv=gl(6,12,labels=LETTERS[1:6])  
##D #creates A,A,A 12 times B B B also 12 times etc.
##D set.seed(99);cost=sample(30:90, 72, replace=TRUE)
##D revenu=sample(50:110, 72, replace=TRUE); month=rep(1:12,6)
##D df=data.frame(indiv,month,cost,revenu);head(df);tail(df)
##D L2cost=PanelLag(ID=month,xj=df[,'cost'], lag=2)
##D head(L2cost)
##D tail(L2cost)
##D 
##D gmcmtx0(cbind(revenu,cost,L2cost))
##D 
##D gmcxy_np(revenu,cost)
## End(Not run)




