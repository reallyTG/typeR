library(itree)


### Name: itree
### Title: Recursive Partitioning and Regression Trees a la rpart, but with
###   some extensions targeted at growing interpretable/parsimonious trees.
### Aliases: itree
### Keywords: tree

### ** Examples

#CART (same as rpart):
fit <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis)
fit2 <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis,
              parms=list(prior=c(.65,.35), split='information'))
fit3 <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis,
              control=itree.control(cp=.05))
par(mfrow=c(1,2), xpd=NA) # otherwise on some devices the text is clipped
plot(fit)
text(fit, use.n=TRUE)
plot(fit2)
text(fit2, use.n=TRUE)

#### new to itree:
#same example, but using one-sided extremes:
fit.ext <- itree(Kyphosis ~ Age + Number + Start, data=kyphosis,method="extremes",
				parms=list(classOfInterest="absent"))
#we see buckets with every y="absent":
plot(fit.ext); text(fit.ext,use.n=TRUE) 


library(mlbench); data(BostonHousing)

#one sided purity:
fit4 <- itree(medv~.,BostonHousing,method="purity",minbucket=25)

#low means tree:
fit5 <- itree(medv~.,BostonHousing,method="extremes",parms=-1,minbucket=25)

#new variable penalty:
fit6 <- itree(medv~.,BostonHousing,penalty="newvar",interp_param1=.2)

#ema penalty
fit7 <- itree(medv~.,BostonHousing,penalty="ema",interp_param1=.1)

#one-sided-purity + new variable penalty:
fit8 <- itree(medv~.,BostonHousing,method="purity",penalty="newvar",interp_param1=.2)

#one-sided extremes for classification must specify a "class of interest"
data(PimaIndiansDiabetes)
levels(PimaIndiansDiabetes$diabetes)  
fit9.a <- itree(diabetes~.,PimaIndiansDiabetes,minbucket=50,
                 method="extremes",parms=list(classOfInterest="neg"))
                 
plot(fit9.a); text(fit9.a)

#can also pass the index of the class of interest in levels().
fit9.b <- itree(diabetes~.,PimaIndiansDiabetes,minbucket=50,
                 method="extremes",parms=list(classOfInterest=1))
# so fit9.a = fit9.b



