library(adespatial)


### Name: tpaired.krandtest
### Title: Paired t-tests of differences between T1 and T2 for each species
### Aliases: tpaired.krandtest

### ** Examples


if(require("vegan", quietly = TRUE)) {

## Invertebrate communities subjected to insecticide treatment.

## As an example in their paper on Principal Response Curves (PRC), van den Brink & ter 
## Braak (1999) used observations on the abundances of 178 invertebrate species 
## (macroinvertebrates and zooplankton) subjected to treatments in 12 mesocosms by the 
## insecticide chlorpyrifos. The mesocosms were sampled at 11 occasions. The data, 
## available in the {vegan} package, are log-transformed species abundances, 
## y.tranformed = loge(10*y+1).

## The data of survey #4 will be compared to those of survey #11 in this example.  
## Survey #4 was carried out one week after the insecticide treatment, whereas the 
## fauna of the mesocosms was considered to have fully recovered from the treatment 
## at the time of survey #11.

data(pyrifos)

## The mesocosms had originally been attributed at random to the treatments. However,  
## to facilitate presentation of the results, they will be listed here in order of 
## increased insecticide doses: {0, 0, 0, 0, 0.1, 0.1, 0.9, 0.9, 6, 6, 44, 44} 
## micro g/L.

survey4.order = c(38,39,41,47,37,44,40,46,43,48,42,45)

survey11.order = c(122,123,125,131,121,128,124,130,127,132,126,129)

## Paired t-tests of differences between survey.4 and survey.11 for the p species

res <- tpaired.krandtest(pyrifos[survey4.order,],pyrifos[survey11.order,])

}




