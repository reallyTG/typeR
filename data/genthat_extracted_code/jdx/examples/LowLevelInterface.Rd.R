library(jdx)


### Name: convertToRlowLevel
### Title: Low-level Interface for jdx
### Aliases: arrayOrderToString convertToRlowLevel createJavaToRobject
###   jdxConstants processCompositeDataCode
### Keywords: interface

### ** Examples

library("jdx")

# Create org.fgilbert.jdx.JavaToR object used to convert 
# java objects to R objects. Create one of these objects
# per thread for thread-safe execution.
# 
# It is also possible to create and use the JavaToR
# object in Java and return a reference to R via rJava.
j2r <- createJavaToRobject()

# Pass the Java object to be converted to the initialize 
# method of the JavaToR object. Note that the Java object
# must be cast as java.lang.Object. The initialize method
# returns an integer value known as a composite data code
# that is used to derive the R structure.
composite.data.code <- rJava::.jcall(
  j2r
  , "I"
  , "initialize"
  , rJava::.jcast(convertToJava(iris))
)

# Process the resulting composite data code to get a data
# code vector. This step also raises any applicable 
# errors/warnings.
data.code <- processCompositeDataCode(j2r, composite.data.code)

# Pass the JavaToR object and the data code to
# convertToRlowLevel to get the R object.
convertToRlowLevel(j2r, data.code, strings.as.factors = FALSE)

# When converting n-dimensional arrays, pass an array 
# ordering constant to the initialize method.
array.order.constants <- jdxConstants()$ARRAY_ORDER
array <- convertToJava(as.matrix(iris[1:4]), array.order = "column-major")
composite.data.code <- rJava::.jcall(
  j2r
  , "I"
  , "initialize"
  , rJava::.jcast(array)
  , array.order.constants[["column-major"]]
)
data.code <- processCompositeDataCode(j2r, composite.data.code)
convertToRlowLevel(j2r, data.code)



