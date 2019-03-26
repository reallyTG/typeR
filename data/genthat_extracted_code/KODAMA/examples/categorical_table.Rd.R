library(KODAMA)


### Name: categorical_table
### Title: Categorical Information
### Aliases: categorical_table
### Keywords: categorical_table

### ** Examples

data(clinical)

A=categorical_table("Gender",clinical[,"Gender"],clinical[,"Hospital"])
B=categorical_table("Gleason score",clinical[,"Gleason score"],clinical[,"Hospital"])
C=categorical_table("Ethnicity",clinical[,"Ethnicity"],clinical[,"Hospital"])

D=continuous_table("BMI",clinical[,"BMI"],clinical[,"Hospital"],digits=2)
E=continuous_table("Age",clinical[,"Age"],clinical[,"Hospital"],digits=1)

rbind(A,B,C,D,E)




