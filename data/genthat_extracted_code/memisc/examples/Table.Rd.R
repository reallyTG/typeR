library(memisc)


### Name: Table
### Title: One-Dimensional Table of Frequences and/or Percentages
### Aliases: Table Table,atomic-method Table,factor-method
###   Table,item.vector-method
### Keywords: univar

### ** Examples

  with(as.data.frame(UCBAdmissions),Table(Admit,Freq))
  Aggregate(Table(Admit,Freq)~.,data=UCBAdmissions)

  A <- sample(c(1:5,9),size=100,replace=TRUE)
  labels(A) <- c(a=1,b=2,c=3,d=4,e=5,dk=9)
  missing.values(A) <- 9
  Table(A,percentage=TRUE)



