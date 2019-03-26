library(EBASS)


### Name: INMB
### Title: A Reference Class to represent the INMB (Incremental Net
###   Monetary Benefit)
### Aliases: INMB

### ** Examples

## First, create a lambda object
object_lambda <- create_object_lambda (20000)
## Then, create an inmb object
object_inmb <- create_object_inmb(de = 0.04, dc=-168, object_lambda = object_lambda)
## inmb is calculated by methods inside the object. Retrieve the inmb :
object_inmb$get_inmb()



