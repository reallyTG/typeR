library(lessR)


### Name: Nest
### Title: Nest the Values of an Integer or Factor Variable
### Aliases: Nest nt
### Keywords: nested models

### ** Examples


d <- Read("Reading", in.lessR=TRUE)

# compare least-squares models
# can specify all the variables in the full model
Nest(Reading, c(Absent), c(Verbal,Absent,Income))
# or, can specify just the additional variables in the full model
Nest(Reading, c(Absent), c(Verbal,Income))

# compare logistic models, save results into an object
# define the full model by adding just the variables
#  not found in the reduced model
d <- Read("BodyMeas", in.lessR=TRUE)
n <- Nest(Gender, c(Weight, Hips, Hand, Shoe),
      c(Height, Waist, Chest), method="logit")
# view the results
n
# see the names of the available output components
names(n)



