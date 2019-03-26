library(liquidSVM)


### Name: liquidData
### Title: Loads or downloads training and testing data
### Aliases: liquidData print.liquidData ttsplit sample.liquidData
###   print.liquidData

### ** Examples

banana <- liquidData('banana-mc')

## to get a smaller sample
liquidData('banana-mc',prob=0.2)
## if you disable stratified then there is some variance in the group sizes:
liquidData('banana-mc',prob=0.2, stratified=FALSE)

## Not run: 
##D ## to downlad a file from our web directory
##D 
##D liquidData("gisette")
##D 
##D ## To get a list of available names:
##D liquidData()
## End(Not run)
## to produce an liquidData from some dataset
ttsplit(iris)
# the following will be stratified
ttsplit(iris,'Species')

# specify a testSize:
ttsplit(trees, testSize=10)
## example for sample.liquidData
banana <- liquidData('banana-mc')
sample.liquidData(banana, prob=0.1)
# this is equivalent to
liquidData('banana-mc', prob=0.1)
## example for print
banana <- liquidData("banana-mc")
print(banana)



