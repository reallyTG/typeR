library(SensMixed)


### Name: sensmixed
### Title: Analysis of sensory data within a mixed effects model framework
### Aliases: sensmixed

### ** Examples



## import SensMixed package
library(SensMixed)

## convert some variables to factors in TVbo
TVbo <- convertToFactors(TVbo, c("Assessor", "Repeat", "Picture"))

## run automated selection process
res <- sensmixed(c("Coloursaturation", "Colourbalance"),
prod_effects = c("TVset", "Picture"), 
assessor="Assessor", data=TVbo, MAM=TRUE)

res


## run MAManalysis function
res_MAM <- sensmixed(c("Coloursaturation", "Colourbalance"),
                 prod_effects=c("TVset"), replication="Repeat", 
                 assessor="Assessor", data=TVbo, control = list(MAM_balanced=TRUE))
## print is not yet implemented
## get anova part
res_MAM[[3]][,,1]

## compare with the general implementation
res <- sensmixed(c("Coloursaturation", "Colourbalance"),
                  prod_effects=c("TVset"), 
                  assessor="Assessor", data=TVbo, MAM=TRUE, 
                  control = list(reduce.random=FALSE))
res$fixed      

## Not run: 
##D res <- sensmixed(names(TVbo)[5:(ncol(TVbo) - 1)],
##D                   prod_effects=c("TVset", "Picture"), 
##D                   assessor="Assessor", 
##D                   data=TVbo)
##D 
##D 
##D plot F and Chi square values
##D plot(res)
## End(Not run)



