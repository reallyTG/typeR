library(pairwise)


### Name: rfa
### Title: Rasch Residual Factor Analysis
### Aliases: rfa

### ** Examples

######################
########
data(bfiN) # loading reponse data
pers_obj <- pers(pair(bfiN))
result <- rfa(pers_obj)
summary(result)
plot(result)
#### 



