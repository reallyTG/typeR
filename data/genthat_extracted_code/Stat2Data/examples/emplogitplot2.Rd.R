library(Stat2Data)


### Name: emplogitplot2
### Title: Empirical logit plot for one quantitative variable by
###   categorical groups
### Aliases: emplogitplot2

### ** Examples

data(MedGPA)
emplogitplot2(Acceptance~GPA+Sex,data=MedGPA)

GroupTable2=emplogitplot2(Acceptance~MCAT+Sex,ngroups=5,out=TRUE,data=MedGPA,putlegend="topleft")

emplogitplot2(Acceptance~MCAT+Sex,data=MedGPA,breaks=c(0,34.5,39.5,50.5),
              levelcol=c("red","blue"),putlegend="bottomright")



