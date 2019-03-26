library(jsr223)


### Name: ScriptEngine
### Title: ScriptEngine Class
### Aliases: ScriptEngine $<-.ScriptEngine $.ScriptEngine [<-.ScriptEngine
###   [.ScriptEngine [[<-.ScriptEngine [[.ScriptEngine %~% %~%.ScriptEngine
###   %@% %@%.ScriptEngine
### Keywords: programming interface

### ** Examples

library("jsr223")

# Create an instance of a JavaScript engine. Note that the
# script engine's JAR file is not required for the class.path
# parameter because JavaScript is included with JRE 8.
engine <- ScriptEngine$new("javascript")

# Evaluate arbitrary code. Multiline code is allowed.
engine %~% "var a = Math.PI;"

# Retrieve the value of a global JavaScript variable.
cat("The value of 'a' is ", engine$a, ".", sep = "")

# Set the value of a global variable. If the variable does
# not exist in the engine environment, it will be created.
engine$a <- 10
cat("The value of 'a' is now ", engine$a, ".", sep = "")

# Use callbacks to set values, get values, and execute R code
# in the current R session via the global R object.
# Access R from JavaScript.
engine %@% "R.set('a', 12);"
engine %@% "print(\"The value of 'a' is now \" + R.get('a') + \".\");"
engine %@% "var randomNormal = R.eval('rnorm(5)');"
engine$randomNormal

# Use a Java object.
engine$randomNormal <- rnorm(5)
engine$randomNormal
engine %@% "java.util.Arrays.sort(randomNormal)"
engine$randomNormal

# Enable property to convert length one vectors to arrays
# instead of scalar values.
engine$setLengthOneVectorAsArray(TRUE)
engine$c <- 1
engine %~% "c[0]" # Returns 1
engine$setLengthOneVectorAsArray(FALSE)

# Suppress console output.
engine$setStandardOutputMode("quiet")
engine %~% "print('Hello (1)');"

# Re-enable console output
engine$setStandardOutputMode("console")
engine %~% "print('Hello (2)');"

# Close the engine and release resources.
engine$terminate()

## Not run: 
##D # Create a JRuby engine by specifying the engine name and
##D # the class path for the engine JAR. The JAR file path
##D # will be different on your system.
##D engine <- ScriptEngine$new(
##D   engine.name = "jruby"
##D   , class.path = "../engines/jruby-complete.jar"
##D )
##D 
##D # Assign a value to a variable. This will create a global
##D # variable in the Ruby environment.
##D engine$c <- pi
##D 
##D # Reference the previous value in a code snippet. Note that
##D # Ruby requires a "$" designator for global variables.
##D engine %~% "3 * $c"
##D 
##D # Evaluate a script file.
##D engine$source("./my_script.rb")
##D 
##D # Terminate the engine.
##D engine$terminate()
## End(Not run)



