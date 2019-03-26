library(tcltk2)


### Name: tclVarFun
### Title: Manipulate R variables and functions from tcl and back
### Aliases: makeTclNames tclFun tclGetValue tclSetValue tclVarExists
###   tclVarFind tclVarName
### Keywords: utilities

### ** Examples

## Not run: 
##D ## These cannot be run by examples() but should be OK when pasted
##D ## into an interactive R session with the tcltk package loaded
##D 
##D ## Tcl functions and variables manipulation
##D tclVarExists("tcl_version")
##D tclVarExists("probably_non_existant")
##D tclVarFind("tcl*")
##D 
##D ## Using tclVarName() and tclGetValue()...
##D ## intented for better match between R and Tcl variables
##D Test <- tclVarName("Test", "this is a test!")
##D ## Now 'Test' exist both in R and in Tcl... In R, you need to use
##D tclvalue(Test) # to retrieve its content
##D ## If a variable already exists in Tcl, its content is preserved using
##D ## keep.existing = TRUE
##D 	
##D ## Create a variable in Tcl and assign "just a test..." to it
##D tclSetValue("A_Variable", "just to test...")
##D ## Create the dual variable with same name
##D A_Variable <- tclVarName("A_Variable", "something else?")
##D tclvalue(A_Variable) # Content of the variable is not changed!
##D 
##D ## If you want to retrieve the content of a Tcl variable,
##D ## but do not want to create a reference to it in R, use:
##D     
##D ## Create a Tcl variable, not visible from R
##D tclSetValue("Another_Variable", 1:5)
##D tclGetValue("Another_Variable") # Get its content in R (no conversion!)
##D tclSetValue("Another_Variable", paste("Am I", c("happy", "sad"), "?"))
##D tclGetValue("Another_Variable") # Get its content in R (no conversion!)
## End(Not run)



