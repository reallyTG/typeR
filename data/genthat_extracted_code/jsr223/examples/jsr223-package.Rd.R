library(jsr223)


### Name: jsr223-package
### Title: A Java Platform Integration for R with Programming Languages
###   Groovy, JavaScript, JRuby (Ruby), Jython (Python), and Kotlin
### Aliases: jsr223-package jsr223
### Keywords: package programming interface

### ** Examples

# Simple example embedding JavaScript.
library("jsr223")
engine <- ScriptEngine$new("javascript")
engine$radius <- 4
engine %~% "var area = Math.PI * Math.pow(radius, 2)"
cat ("The area of the circle is ", engine$area, ".\n", sep = "")

# Use callbacks to set values, get values, and execute R code
# in the current R session via the global R object.
# Access R from JavaScript.
engine %@% "R.set('a', 12);"
engine %@% "print(\"The value of 'a' is \" + R.get('a') + \".\");"
engine %@% "var randomNormal = R.eval('rnorm(5)');"
engine$randomNormal

# Use a Java object.
engine$randomNormal <- rnorm(5)
engine$randomNormal
engine %@% "java.util.Arrays.sort(randomNormal)"
engine$randomNormal

# Close the engine and release resources.
engine$terminate()



