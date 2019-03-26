library(Hmisc)


### Name: score.binary
### Title: Score a Series of Binary Variables
### Aliases: score.binary
### Keywords: manip

### ** Examples

set.seed(1)
age <- rnorm(25, 70, 15)
previous.disease <- sample(0:1, 25, TRUE)
#Hierarchical scale, highest of 1:age>70  2:previous.disease
score.binary(age>70, previous.disease, retfactor=FALSE)
#Same as above but return factor variable with levels "none" "age>70" 
# "previous.disease"
score.binary(age>70, previous.disease)


#Additive scale with weights 1:age>70  2:previous.disease
score.binary(age>70, previous.disease, fun=sum)
#Additive scale, equal weights
score.binary(age>70, previous.disease, fun=sum, points=c(1,1))
#Same as saying points=1


#Union of variables, to create a new binary variable
score.binary(age>70, previous.disease, fun=any)



