library(confreq)


### Name: chi_local_test_cfa
### Title: Local Chi-Square Test
### Aliases: chi_local_test_cfa

### ** Examples

#######################################
# first calculate expected counts for LienertLSD data example.
designmatrix<-design_cfg_cfa(kat=c(2,2,2)) # generate an designmatrix (only main effects)
data(LienertLSD) # load example data
observed<-LienertLSD[,4] # extract observed counts
expected<-expected_cfa(des=designmatrix, observed=observed) # calculation of expected counts
 chi_local_test_cfa(observed,expected)
####################################### 



