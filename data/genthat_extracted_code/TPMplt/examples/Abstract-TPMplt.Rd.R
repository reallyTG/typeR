library(TPMplt)


### Name: Abstract-TPMplt
### Title: Tool-Kit for Dynamic Materials Model and Thermal Processing Maps
### Aliases: Abstract-TPMplt Abstract-TPMplt-package

### ** Examples

## Not run: 
##D # Check the factors in column names of input data:
##D # Note: Temperature in layer2, Strain Rate in layer3.
##D require(VBTree)
##D vbt <- dl2vbt(chrvec2dl(colnames(TPMdata)))
##D vbt
##D 
##D # Export Strain Rate-Temperature table based on
##D # given strain condition (epsilon):
##D epstable <- epsExtract(TPMdata, 0.7, 2, 3)
##D 
##D # Build dynamic materials model (DMM) from Strain
##D # Rate-Temperature table:
##D DMM <- DMMprocess(epstable)
##D 
##D # Choose regression method for plots:
##D PLTbd <- SVRModel(DMM)
##D 
##D # 2D processing-map through selected regression method:
##D TPM2dplt(PLTbd)
##D 
##D # 3D processing-map through selected regression method:
##D TPM3dplt(PLTbd)
## End(Not run)



