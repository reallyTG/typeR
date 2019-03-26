library(rddtools)


### Name: clusterInf
### Title: Post-inference for clustered data
### Aliases: clusterInf

### ** Examples

data(house)
house_rdd <- rdd_data(y=house$y, x=house$x, cutpoint=0)
reg_para <- rdd_reg_lm(rdd_object=house_rdd)

# here we just generate randomly a cluster variable:
nlet <- sort(c(outer(letters, letters, paste, sep='')))
clusRandom <- sample(nlet[1:60], size=nrow(house_rdd), replace=TRUE)

# now do post-inference:
clusterInf(reg_para, clusterVar=clusRandom)
clusterInf(reg_para, clusterVar=clusRandom, type='HC')



