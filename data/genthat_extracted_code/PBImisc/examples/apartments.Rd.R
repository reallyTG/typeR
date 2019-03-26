library(PBImisc)


### Name: apartments
### Title: Apartment prices in Warsaw in years 2007-2009
### Aliases: apartments
### Keywords: apartments

### ** Examples

data(apartments)
library(lattice)
xyplot(m2.price~construction.date|district, apartments, type=c("g","p"))

# 
# apartments2 = na.omit(apartments[,c(13,1,3,5,7,8,9,10,14,15,16)])
# wsp = (bincombinations(10)==1)[-1,]
# params = matrix(0, nrow(wsp), 3)
# for (i in 1:nrow(wsp)) {
# 	  model = lm(m2.price~., data=apartments2[,c(TRUE,wsp[i,])])
#   	params[i,1] = AIC(model, k=log(nrow(apartments2)))
#  	  params[i,2] = model$rank
#  	  params[i,3] = summary(model)$adj.r.squared
# }
# plot(params[,2], params[,3], xlab="no. of regressors", ylab="adj R^2")
# 



