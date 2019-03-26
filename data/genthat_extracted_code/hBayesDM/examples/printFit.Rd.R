library(hBayesDM)


### Name: printFit
### Title: Print model-fits (mean LOOIC or WAIC values in addition to
###   Akaike weights) of hBayesDM Models
### Aliases: printFit

### ** Examples

## Not run: 
##D # Run two models and store results in "output1" and "output2"
##D output1 <- dd_hyperbolic("example", 2000, 1000, 3, 3)
##D 
##D output2 <- dd_exp("example", 2000, 1000, 3, 3)
##D 
##D # Show the LOOIC model fit estimates
##D printFit(output1, output2)
##D 
##D # To show the WAIC model fit estimates
##D printFit(output1, output2, ic = "waic")
##D 
##D # To show both LOOIC and WAIC
##D printFit(output1, output2, ic = "both")
## End(Not run)



