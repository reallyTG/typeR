library(gwfa)


### Name: grid_to_spdf
### Title: Transforms Grid Object into SpatialPolygonsDataFrame
### Aliases: grid_to_spdf

### ** Examples

library(gwfa)

data("mariegalante")

test=gwfa(points=mariegalante,q=0,radius=(20*2^((0:6)/2)),
bandwith=1600,sample_size=500,cell_size=2000)
test=test[test$count>100,]#select the cells with at least 100 points. 


#estimate the fractal dimension on the 7 radius
X=cbind(rep(1,length(test@radius)),log2(test@radius))
fit_frac_dim=(do.call(cbind,test[,4:10]))%*%t(solve(t(X)%*%X)%*%t(X))
test$dimfrac=fit_frac_dim[,2]

#create spatial polygon dataframe
shp=grid_to_spdf(test,"2970")





