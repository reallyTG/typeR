library(MixAll)


### Name: kmm
### Title: Create an instance of the ['KmmModel'] class
### Aliases: kmm

### ** Examples

## A quantitative example with the famous bulls eye model
data(bullsEye)
## estimate model
model <- kmm( data=bullsEye, nbCluster=2:3, models= "kmm_pk_s")


## get summary
summary(model)
## use graphics functions
## Not run: 
##D plot(model)
## End(Not run)




