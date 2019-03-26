library(PythonInR)


### Name: pyImport
### Title: Import virtual Python objects to R
### Aliases: pyImport

### ** Examples

## Don't show: 
PythonInR:::pyCranConnect()
## End(Don't show)
pyImport("os")
## Not run: 
##D #NOTE: The following does not only import numpy but also register the
##D #      alias in the options under the name "numpyAlias". 
##D #      The same is done for pandas, the default alias for pandas and numpy 
##D #      are respectively "pandas" and "numpy". The numpyAlias is used 
##D #      when calling pySet with the pyOption useNumpy set to TRUE.
##D pyOptions("numpyAlias")
##D pyImport("numpy", as="np")
##D pyOptions("numpyAlias")
##D pyImport("pandas", as="pd")
##D pyImport(c("getcwd", "sep"), from="os")
##D getcwd()
##D sep
##D sep = "Hello R!"
##D pyExecp("sep")
## End(Not run)



