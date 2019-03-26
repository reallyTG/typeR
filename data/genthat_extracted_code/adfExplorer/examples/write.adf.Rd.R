library(adfExplorer)


### Name: write.adf
### Title: Write an amigaDisk object to an ADF file
### Aliases: write.adf write.adf,amigaDisk,ANY-method
###   write.adf,amigaDisk,character-method write.adz
###   write.adz,amigaDisk,character-method

### ** Examples

## Not run: 
##D ## Let's write the example data to an ADF file:
##D data(adf.example)
##D 
##D ## Let's put it in the current working directory:
##D write.adf(adf.example, "test.adf")
##D 
##D ## You can also use file connections to do the same:
##D con <- file("test2.adf", "wb")
##D write.adf(adf.example, con)
##D close(con)
##D 
##D ## Last but not least the same object can be saved
##D ## as an adz file:
##D write.adz(adf.example, "test.3.adz")
## End(Not run)



