library(DOS)


### Name: addalmostexact
### Title: Use a Penalty to Obtain a Near Exact Match
### Aliases: addalmostexact

### ** Examples

data(costa)
z<-1*(costa$welder=="Y")
aa<-1*(costa$race=="A")
smoker=1*(costa$smoker=="Y")
age<-costa$age
x<-cbind(age,aa,smoker)
dmat<-mahal(z,x)
# Mahalanobis distances
round(dmat[,1:6],2)
# Mahalanobis distanced penalized for mismatching on smoking.
dmat<-addalmostexact(dmat, z, smoker, mult = 10)
# The first treated subject (row labeled 27) is a nonsmoker, but the
# third control (column 3) is a smoker, so there is a big penalty.
round(dmat[,1:6],2)



