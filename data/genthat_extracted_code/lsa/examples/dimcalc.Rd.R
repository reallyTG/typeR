library(lsa)


### Name: dimcalc
### Title: Dimensionality Calculation Routines (LSA)
### Aliases: dimcalc dimcalc_share dimcalc_ndocs dimcalc_kaiser dimcalc_raw
###   dimcalc_fraction
### Keywords: algebra

### ** Examples


## create some data 
vec1 = c( 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 )
vec2 = c( 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0 )
vec3 = c( 0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0 )
matrix = cbind(vec1,vec2, vec3)
s = svd(matrix)$d

# standard share of 0.5
dimcalc_share()(s) 

# specific share of 0.9
dimcalc_share(share=0.9)(s) 

# meeting the number of documents (here: 3)
n = ncol(matrix)
dimcalc_ndocs(n)(s)




