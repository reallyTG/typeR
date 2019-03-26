library(PythonInR)


### Name: pyConnect
### Title: connects R to Python
### Aliases: pyConnect pyConnectWinDll

### ** Examples

## Not run: 
##D ## Linux examples
##D pyConnect() # is done by default when the package is loaded
##D 
##D ## Windows examples
##D pyConnect() ## will try to detect a suitable python version 
##D             ## from the PATH given in the environment variables
##D pyConnect("C:\\Python27\\python.exe")
##D 
##D ## One can also explicitly set the parameters for the connection.
##D PythonInR:::pyConnectWinDll(dllName="python27.dll", dllDir=NULL,
##D                             majorVersion=2, pythonHome="C:\\Python27", 
##D                             pyArch="32bit")
## End(Not run)



