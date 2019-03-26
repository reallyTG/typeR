library(RSDA)


### Name: USCrime
### Title: Us crime classic data table
### Aliases: USCrime
### Keywords: datasets

### ** Examples

data(USCrime)
us.crime<-USCrime
dim(us.crime)
head(us.crime)
summary(us.crime)
names(us.crime)
nrow(us.crime)
result  <- classic.to.sym(us.crime, concept='state',
                          variables =c(NumInShelters, NumImmig),
                          variables.types =c(NumInShelters = type.histogram(),
                           NumImmig = type.histogram()))
result



