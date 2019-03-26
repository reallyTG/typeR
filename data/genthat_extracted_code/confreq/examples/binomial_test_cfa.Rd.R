library(confreq)


### Name: binomial_test_cfa
### Title: Binomial Test
### Aliases: binomial_test_cfa

### ** Examples

#######################################
# first calculate expected counts for LienertLSD data example.
designmatrix<-design_cfg_cfa(kat=c(2,2,2)) # generate an designmatrix (only main effects)
data(LienertLSD) # load example data
observed<-LienertLSD[,4] # extract observed counts
expected<-expected_cfa(des=designmatrix, observed=observed) # calculation of expected counts
 binomial_test_cfa(observed,expected)
####################################### 



