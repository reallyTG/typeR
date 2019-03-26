library(geostatsp)


### Name: variog
### Title: Compute Empirical Variograms and Permutation Envelopes
### Aliases: variog variog.default variog.SpatialPointsDataFrame
###   variogMcEnv variogMcEnv.default variogMcEnv.SpatialPointsDataFrame

### ** Examples

data("swissRain")
swissRain$lograin = log(swissRain$rain)
swissv= variog(swissRain, formula=lograin ~ 1,option="bin")
swissEnv = variogMcEnv(swissRain, lograin ~ 1, obj.var=swissv,nsim=9) 
if(!is.null(swissv)){
	plot(swissv, env=swissEnv, main = "Swiss variogram")
}



