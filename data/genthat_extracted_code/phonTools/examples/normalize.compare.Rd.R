library(phonTools)


### Name: normalize.compare
### Title: Compare Normalization Methods
### Aliases: normalize.compare

### ** Examples

## load the Peterson and Barney vowels
data (pb52)

## normalize using several different methods
neareyE = normalize (pb52[,7:9], pb52$speaker, pb52$vowel, 
method = 'neareyE')
neareyI = normalize (pb52[,7:9], pb52$speaker, pb52$vowel, 
method = 'neareyI')
lobanov = normalize (pb52[,7:9], pb52$speaker, pb52$vowel, 
method = 'lobanov')
wandf = normalize (pb52[,7:9], pb52$speaker, pb52$vowel, 
method = 'wandf', corners =  c('i','A'))
normd = list (pb52, neareyE, neareyI, lobanov, wandf)

## compare outcome of methods (and unnormalized vowels)
## uncomment to run
#normalize.compare (normd)



