library(pmmlTransformations)


### Name: MapXform
### Title: Implements a map between discrete values in accordance to the
###   PMML element: *MapValues*
### Aliases: MapXform
### Keywords: manip

### ** Examples

# Load the standard audit dataset, part of the pmml package
   library(pmml)
   library(pmmlTransformations)
   data(audit)

# First wrap the data
   auditBox <- WrapData(audit)

## Not run: 
##D # One of the variables, "Sex", has 2 possible values: "Male" 
##D # and "Female". If these string values have to be mapped to a 
##D # numeric value, a file has to becreated, say "MapGender.csv" 
##D # whose content is, for example:
##D #
##D #  Male,1
##D #  Female,2
##D #
##D # Transform the variable "Gender" to a variable "d_gender" 
##D # such that:
##D #    if Sex = "Male" then d_sex = "1"
##D #    if Sex = "Female" then d_sex = "0"
##D #
##D # Give "d_sex" the value 0 if the input variable value is 
##D # missing.
##D   auditBox <- MapXform(auditBox,
##D                       xformInfo="[Sex -> d_sex][string->integer]", 
##D 	                    table="MapGender.csv",mapMissingTo="0")
## End(Not run)
# same as above, with an extra variable, but using data frames.
# The top 2 rows gives the variable names and their data types. 
# The rest represent the map. So for example, the third row 
# indicates that when the input variable "Sex" has the value 
# "Male" and the input variable "Employment" has
# the value "PSLocal", the output variable "d_sex" should have 
# the value 1. 
   t <- list()
   m <- data.frame(c("Sex","string","Male","Female"),
                  c("Employment","string","PSLocal","PSState"),
	c("d_sex","integer",1,0))
   t[[1]] <- m

# give default value as a vector and missing value as a string,
# this is only possible as there is only one map defined. If 
# default values is not given, it will simply not be given in 
# the PMML file as well. In general, the default values and the 
# missing values should be given as a vector, each element of 
# the vector corresponding to the element at the same index in 
# the list. If these values are not given as a vector, they will 
# be used for the first list element only.
   auditBox<-MapXform(auditBox,xformInfo=t,defaultValue=c(3),
                      mapMissingTo="2")

# check what the pmml looks like
  fit<-lm(Adjusted~.,data=auditBox$data)
  pmml(fit,transforms=auditBox)




