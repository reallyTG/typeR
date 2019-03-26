library(ev.trawl)


### Name: GenerateParameters
### Title: Computes initial guess for Univariate Latent-Trawl model. Uses
###   'fExtreme' package method 'gpdFit' to fit MLE.
### Aliases: GenerateParameters

### ** Examples

# TODO ADD data
data(hourlyhourly_bloomsbury_air_pollution_2000_2017)
GenerateParameters(data = hourly_bloomsbury_air_pollution_2000_2017$O3[1:1000], cluster.size = 8)




