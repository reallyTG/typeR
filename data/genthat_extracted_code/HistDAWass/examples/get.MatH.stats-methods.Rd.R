library(HistDAWass)


### Name: get.MatH.stats
### Title: Method get.MatH.stats
### Aliases: get.MatH.stats get.MatH.stats,MatH-method

### ** Examples

get.MatH.stats(BLOOD) # the means of the distributions in BLOOD dataset
get.MatH.stats(BLOOD,stat='median') # the medians of the distributions in BLOOD dataset
get.MatH.stats(BLOOD,stat='quantile', prob=0.5) #the same as median
get.MatH.stats(BLOOD,stat='min') # minima of the distributions in BLOOD dataset
get.MatH.stats(BLOOD,stat='quantile', prob=0) #the same as min
get.MatH.stats(BLOOD,stat='max') # maxima of the distributions in BLOOD dataset
get.MatH.stats(BLOOD,stat='quantile', prob=1) #the same as max
get.MatH.stats(BLOOD,stat='std') # standard deviations of the distributions in BLOOD dataset
get.MatH.stats(BLOOD,stat='skewness') #skewness indices of the distributions in BLOOD dataset
get.MatH.stats(BLOOD,stat='kurtosis') #kurtosis indices of the distributions in BLOOD dataset
get.MatH.stats(BLOOD,stat='quantile',prob=0.05) 
#the fifth percentiles of distributions in BLOOD dataset



