library(staRdom)


### Name: eempf4analysis
### Title: Create table of PARAFAC components and (optionally) EEM peaks
###   and indices as well as absorbance slope parameters.
### Aliases: eempf4analysis

### ** Examples

## No test: 
data(eem_list)
data(pfres_comps2)
data(abs_data)

results <- eempf4analysis(pfmodel = pfres_comps2[[2]],
                          eem_list = eem_list, absorbance = abs_data,
                          cuvl = 5, n = 4)
                          
## End(No test)



