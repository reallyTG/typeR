library(rGroovy)


### Name: rGroovy
### Title: Groovy Scripting Language Integration
### Aliases: rGroovy rGroovy-package

### ** Examples

 ## Not run: 
##D #
##D # Installation Example
##D #
##D # Since this package does not ship with Groovy the user needs to specify the Groovy jars prior
##D # to using the package -- here's an example how this is accomplished:
##D #
##D groovyJars <- list (
##D     "C:/Temp/groovy.jars/groovy-2.4.5-indy.jar",
##D     # OTHER JAR FILES...
##D )
##D 
##D options(GROOVY_JARS=groovyJars)
##D 
##D library(rGroovy)
##D 
##D Execute (groovyScript="print 'Hello world!'")
## End(Not run)




