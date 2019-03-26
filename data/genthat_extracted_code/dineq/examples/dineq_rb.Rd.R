library(dineq)


### Name: dineq_rb
### Title: Regression-based decomposition of inequality
### Aliases: dineq_rb

### ** Examples

#Decomposition of the income inequality into 4 variables using Mexican Income data set:
data(mex_inc_2008)
inequality_decomp <- dineq_rb(income~hh_structure+education+domicile_size+age_cat,
weights="factor", data=mex_inc_2008)

#selection of the output: decomposition of the inequality into the contribution of the
#different variables and residual (adds up to 100 percent)
inequality_decomp["decomposition_inequality"]




