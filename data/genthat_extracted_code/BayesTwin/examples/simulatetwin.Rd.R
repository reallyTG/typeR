library(BayesTwin)


### Name: simulatetwin
### Title: Simulate item-level twin data
### Aliases: simulatetwin simulatetwindata Simulatedata
### Keywords: utilities

### ** Examples

#100 MZ twins, 200 DZ twins, ACE model, no GxE, 1 PL: 
simulatetwin(n_mz = 100, n_dz = 200) 

## Not run: 
##D #500 MZ twins, 800 DZ twins, ACE model, no GxE, 1 PL: 
##D simulatetwin(n_mz = 500, n_dz = 800) 
##D 
##D #140 MZ twins, 360 DZ twins, ADE model, GPCM: 
##D simulatetwin(var_a = 0.4, var_d = 0.2, var_e = 0.4, 
##D              model = "ADE", irt_model = "GPCM")
## End(Not run)



