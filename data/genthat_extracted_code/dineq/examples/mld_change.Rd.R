library(dineq)


### Name: mld_change
### Title: Decomposition of the change of the mean log deviation
### Aliases: mld_change

### ** Examples

#Decomposition of the change in mean log deviation by level of eduction using
#Mexican Income data set
data(mex_inc_2008)

change_education <- mld_change(x1=mex_inc_2008$income, z1=mex_inc_2008$education,
weights1=mex_inc_2008$factor, x2=mex_inc_2016$income, z2=mex_inc_2016$education,
weights2=mex_inc_2016$factor)

#selection of the output: decomposition of the change into within- and between-group
#contribution and change in de size of groups (adds up to 100 percent)
change_education["relative_contributions_difference"]




