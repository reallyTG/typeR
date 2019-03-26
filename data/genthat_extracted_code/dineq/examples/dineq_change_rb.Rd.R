library(dineq)


### Name: dineq_change_rb
### Title: Decomposition of the change in inequality
### Aliases: dineq_change_rb

### ** Examples

#Decomposition of the change in income inequality into 4 variables using the Mexican Income
#data set
data(mex_inc_2008)
inequality_change <- dineq_change_rb(formula1=income~hh_structure+education+domicile_size+age_cat,
weights1="factor",data1=mex_inc_2008, formula2=income~hh_structure+education+
domicile_size+age_cat, weights2="factor",data2=mex_inc_2016)

#selection of output: change in variance of log income decomposed in variables split into price
#and quantity effect and residual.
inequality_change["decomposition_change_absolute"]

#selection of output: relatieve change in variance of log income decomposed in variables split
#into price and quantity effect and residual. Because of negative change in variance of log
#income, the negative contributuon of education (quantity) becomes a positive number.
inequality_change["decomposition_change_relative"]




