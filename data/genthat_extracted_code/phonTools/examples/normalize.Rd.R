library(phonTools)


### Name: normalize
### Title: Normalize Vowels
### Aliases: normalize

### ** Examples

## normalize all Peterson & Barney (1952) vowels using each method.
data (pb52)

neareyE = normalize (pb52[,7:9], pb52$speaker, pb52$vowel,
method = 'neareyE')
neareyI = normalize (pb52[,7:9], pb52$speaker, pb52$vowel,
method = 'neareyI')
lobanov = normalize (pb52[,7:9], pb52$speaker, pb52$vowel,
method = 'lobanov')
wandf = normalize (pb52[,7:9], pb52$speaker, pb52$vowel,
method = 'wandf', corners =  c('i','A'))

## compare normalization methods using vowelplot().
par (mfrow = c(2,2), mar = c(4,4,3,1))
vowelplot (neareyE[,1], neareyE[,2], neareyE$vowel, alternateAxes = TRUE, 
  pointType = 16, main = 'neareyE', ellipses = TRUE)
vowelplot (neareyI[,1], neareyI[,2], neareyI$vowel, alternateAxes = TRUE, 
  pointType = 16, main = 'neareyI', ellipses = TRUE)
vowelplot (lobanov[,1], lobanov[,2], lobanov$vowel, alternateAxes = TRUE, 
  pointType = 16, main = 'lobanov', ellipses = TRUE)
vowelplot (wandf[,1], wandf[,2], wandf$vowel, alternateAxes = TRUE, 
  pointType = 16, main = 'wandf', ellipses = TRUE)



