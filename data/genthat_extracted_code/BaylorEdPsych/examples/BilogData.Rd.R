library(BaylorEdPsych)


### Name: BilogData
### Title: Create Fixed Width Data File for use with BILOG-MG
### Aliases: BilogData
### Keywords: BILOR-MG Item Response Theory

### ** Examples

#Simulate dichotomous data with ID	
datt<-cbind(rnorm(100), rnorm(100), rnorm(100))
d.datt<-dim(datt)
datt<-as.numeric(datt > 0)
dim(datt)<-d.datt
datt<-data.frame(ID=seq(1,100), datt)

#Export \emph{mydata.dat} file to working directory 
BilogData(datt, idvar="ID")

#Print the exported data frame, \emph{Test5.dat}, on screen, too
BilogData(datt, data.name = "Test5", ret.val=TRUE, idvar="ID")



