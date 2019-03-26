library(Rdpack)


### Name: Rdpack-package
### Title: Update and Manipulate Rd Documentation Objects
### Aliases: Rdpack-package Rdpack
### Keywords: package

### ** Examples

## The examples below show typical use but are not executable.
## For executable examples see the help pages of 
## reprompt, promptPackageSexpr, and rebib.

## To make the examples executable, replace "myfun" with a real
## function, and similarly for classes and paths to files.

## Not run: 
##D ## update the doc. from the Rd source and save myfun.Rd
##D ##     in the current directory (like prompt)
##D reprompt(infile="path/to/mypackage/man/myfun.Rd")
##D 
##D ## update doc of myfun() from the installed doc (if any);
##D ##     if none is found, create it like prompt
##D reprompt("myfun")
##D reprompt(myfun)      # same
##D 
##D ## update doc. for S4 methods from Rd source
##D reprompt(infile="path/to/mypackage/man/myfun-methods.Rd")
##D 
##D ## update doc. for S4 methods from installed doc (if any);
##D ##     if none is found, create it like promptMethods
##D reprompt("myfun", type = "methods")
##D reprompt("myfun-methods")  # same
##D 
##D 
##D ## update doc. for S4 class from Rd source
##D reprompt(infile="path/to/mypackage/man/myclass-class.Rd")
##D 
##D ## update doc. of S4 class from installed doc.
##D ##     if none is found, create it like promptClass
##D reprompt("myclass-class")
##D reprompt("myclass", type = "class")  # same
##D 
##D 
##D ## create a skeleton "mypackage-package.Rd"
##D promptPackageSexpr("mypackage")
##D 
##D ## update the references in "mypackage-package.Rd"
##D rebib(infile="path/to/mypackage/man/mypackage-package.Rd", force=TRUE)
## End(Not run)



