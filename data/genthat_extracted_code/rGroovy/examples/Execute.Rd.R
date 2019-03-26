library(rGroovy)


### Name: Execute
### Title: Function executes the groovy script and returns the result.
###   Execute differs from Evaluate in that references to Groovy objects
###   are not required. The call to Initialize is not required in order to
###   call this function either however keep in mind that a new instance of
###   groovy.lang.GroovyShell will be used every time this function is
###   called.
### Aliases: Execute

### ** Examples

 ## Not run: 
##D  variables <- list ()
##D 
##D  variables["name"] = "Tom"
##D  variables["day"]  = "Wednesday"
##D 
##D  groovyScript <- "return \"Hello ${name}, how are you doing? Today is ${day}.\""
##D 
##D  result <- Execute (groovyScript=groovyScript, variables=variables)
##D  result
##D  
## End(Not run)




