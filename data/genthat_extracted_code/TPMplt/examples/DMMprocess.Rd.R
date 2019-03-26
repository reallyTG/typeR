library(TPMplt)


### Name: DMMprocess
### Title: Dynamic material modeling from strain rate temperature table
### Aliases: DMMprocess
### Keywords: DMMprocess DMMresult epsExtract

### ** Examples

require(VBTree)
dl2vbt(chrvec2dl(colnames(TPMdata)))
epstable <- epsExtract(TPMdata, 0.7, 2, 3)

# Without calculation for constitutive equation
DMM <- DMMprocess(epstable)
print(DMM)

## Not run: 
##D # Calculating for constitutive equation but
##D # Without plots printout.
##D DMM <- DMMprocess(epstable, ConsFunc=TRUE)
##D print(DMM)
##D 
##D # Calculating for constitutive equation and
##D # required fitting plots printout.
##D DMMprocess(epstable, InteractMode=TRUE, ConsFunc=TRUE)
## End(Not run)




