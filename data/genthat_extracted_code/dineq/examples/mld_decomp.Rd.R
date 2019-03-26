library(dineq)


### Name: mld_decomp
### Title: Decomposition of the mean log deviation
### Aliases: mld_decomp

### ** Examples

#Decomposition of mean log deviation by level of education using Mexican Income data set
data(mex_inc_2008)
education_decomp <- mld_decomp(x=mex_inc_2008$income,z=mex_inc_2008$education,
weights=mex_inc_2008$factor)

#complete output
education_decomp

#Selected output: decomposition into between- and within-group inequality
education_decomp["mld_decomp"]




