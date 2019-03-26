library(dineq)


### Name: gini_decomp
### Title: Decomposition of the Gini coefficient
### Aliases: gini_decomp

### ** Examples

#Decomposition of the gini coefficient by level of education using Mexican Income data set
data(mex_inc_2008)
education_decomp <- gini_decomp(x=mex_inc_2008$income,z=mex_inc_2008$education,
weights=mex_inc_2008$factor)

#complete output
education_decomp

#Selected output: decomposition into between- and within-group inequality and overlap (interaction)
education_decomp["gini_decomp"]




