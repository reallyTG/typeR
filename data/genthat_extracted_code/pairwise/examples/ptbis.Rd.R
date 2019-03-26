library(pairwise)


### Name: ptbis
### Title: Point Biserial Correlations
### Aliases: ptbis

### ** Examples

######################
########
data(sim200x3) # loading reponse data
y <- rowSums(sim200x3)
ptbis(y=y, daten=sim200x3)
#### 
result <- pers(pair(sim200x3))
ptbis(y= result)



