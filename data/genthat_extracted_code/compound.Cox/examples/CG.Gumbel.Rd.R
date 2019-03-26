library(compound.Cox)


### Name: CG.Gumbel
### Title: Copula-graphic estimator under the Gumbel copula.
### Aliases: CG.Gumbel
### Keywords: dependent censoring copula copula-graphic estimator

### ** Examples

## Example 1 (a toy example of n=8) ##
t.vec=c(1,3,5,4,7,8,10,13)
d.vec=c(1,0,0,1,1,0,1,0)
CG.Gumbel(t.vec,d.vec,alpha=9,S.col="blue")
### CG.Gumbel gives identical results with the Kaplan-Meier estimator with alpha=0 ### 
CG.Gumbel(t.vec,d.vec,alpha=0,S.plot=FALSE)$surv
survfit(Surv(t.vec,d.vec)~1)$surv

## Example 2 (Analysis of the lung cancer data) ##
data(Lung) # read the data
t.vec=Lung[,"t.vec"]
d.vec=Lung[,"d.vec"]
x.vec=Lung[,"MMP16"] # the gene associated with survival (Emura and Chen 2016, 2018) #
Poor=x.vec>median(x.vec) ## Indicator of poor survival
Good=x.vec<=median(x.vec) ## Indicator of good survival

par(mfrow=c(1,2))
###### Predicted survival curves via the CG estimator #####
t.good=t.vec[Good]
d.good=d.vec[Good]
CG.Gumbel(t.good,d.good,alpha=9,S.plot=TRUE,S.col="blue")

t.poor=t.vec[Poor]
d.poor=d.vec[Poor]
CG.Gumbel(t.poor,d.poor,alpha=9,S.plot=TRUE,S.col="red")



