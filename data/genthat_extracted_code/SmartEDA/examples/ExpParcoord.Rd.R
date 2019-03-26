library(SmartEDA)


### Name: ExpParcoord
### Title: Parallel Co-ordinate plots
### Aliases: ExpParcoord

### ** Examples

CData = ISLR::Carseats
# Defualt ExpParcoord funciton
ExpParcoord(CData,Group=NULL,Stsize=NULL,
Nvar=c("Price","Income","Advertising","Population","Age","Education"))
# With Stratified rows and selected columns only
ExpParcoord(CData,Group="ShelveLoc",Stsize=c(10,15,20),
Nvar=c("Price","Income"),Cvar=c("Urban","US"))
# Without stratification
ExpParcoord(CData,Group="ShelveLoc",Nvar=c("Price","Income"),
Cvar=c("Urban","US"),scale=NULL)
# Scale changed std: univariately, subtract mean and divide by standard deviation
ExpParcoord(CData,Group="US",Nvar=c("Price","Income"),
Cvar=c("ShelveLoc"),scale="std")
# Selected numeric variables
ExpParcoord(CData,Group="ShelveLoc",Stsize=c(10,15,20),
Nvar=c("Price","Income","Advertising","Population","Age","Education"))




