library(SmartEDA)


### Name: ExpNumStat
### Title: Summary statistics for numerical variables
### Aliases: ExpNumStat

### ** Examples

## Descriptive summary of numeric variables - Summary by Target variables
ExpNumStat(mtcars,by="G",gp="gear",Qnt=c(0.1,0.2),MesofShape=2,
Outlier=TRUE,round=3)
## Descriptive summary of numeric variables - Summary by Overall
ExpNumStat(mtcars,by="A",gp="gear",Qnt=c(0.1,0.2),MesofShape=2,
Outlier=TRUE,round=3)
## Descriptive summary of numeric variables - Summary by Overall and Group
ExpNumStat(mtcars,by="GA",gp="gear",Qnt=seq(0,1,.1),MesofShape=1,
Outlier=TRUE,round=2)
## Summary by specific statistics for all numeric variables
ExpNumStat(mtcars,by="GA",gp="gear",Qnt=c(0.1,0.2),MesofShape=2,
Outlier=FALSE,round=2,dcast = TRUE,val = "IQR")



