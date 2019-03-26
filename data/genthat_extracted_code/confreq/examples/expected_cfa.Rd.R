library(confreq)


### Name: expected_cfa
### Title: Expected frequencies with glm
### Aliases: expected_cfa

### ** Examples

#######################################
# expected counts for LienertLSD data example.
designmatrix<-design_cfg_cfa(kat=c(2,2,2)) # generate an designmatrix (only main effects)
data(LienertLSD) # load example data
observed<-LienertLSD[,4] # extract observed counts
expected_cfa(des=designmatrix, observed=observed) # calculation of expected counts
####################################### 



