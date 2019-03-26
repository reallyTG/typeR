library(VCA)


### Name: getCmatrix
### Title: Coefficient Matrix for (V)ariance (C)omponent (A)nalysis.
### Aliases: getCmatrix

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D C_ms <- getCmatrix(y~day/run, dataEP05A2_1, type="MS")
##D C_ms
##D C_ss <- getCmatrix(y~day/run, dataEP05A2_1, type="SS")
##D C_ss
##D aov.tab <- anova(lm(y~day+day:run, dataEP05A2_1))
##D aov.tab
##D apply(C_ss, 2, function(x) x/aov.tab[,"Df"])
## End(Not run)



