library(Stat2Data)


### Name: emplogitplot1
### Title: Empirical logit plot for one quantitative variable
### Aliases: emplogitplot1

### ** Examples

data(MedGPA)
emplogitplot1(Acceptance~GPA,data=MedGPA)

GroupTable=emplogitplot1(Acceptance~MCAT,ngroups=5,out=TRUE,data=MedGPA)

emplogitplot1(Acceptance~MCAT,data=MedGPA,breaks=c(0,34.5,39.5,50.5),dotcol="red",linecol="black")

data(Putts1)
emplogitplot1(Made~Length,data=Putts1,ngroups="all")




