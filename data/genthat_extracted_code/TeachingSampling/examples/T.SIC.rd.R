library(TeachingSampling)


### Name: T.SIC
### Title: Computation of Population Totals for Clusters
### Aliases: T.SIC
### Keywords: survey

### ** Examples

############
## Example 1
############
# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
# Vector y1 and y2 are the values of the variables of interest
y1<-c(32, 34, 46, 89, 35)
y2<-c(1,1,1,0,0)
y3<-cbind(y1,y2)
# Vector Cluster contains a indicator variable of cluster membership 
Cluster <- c("C1", "C2", "C1", "C2", "C1")
Cluster
# Draws a stratified simple random sample without replacement of size n=3
T.SIC(y1,Cluster)
T.SIC(y2,Cluster)
T.SIC(y3,Cluster)

########################################################
## Example 2 Sampling and estimation in Cluster smapling
########################################################
# Uses Lucy data to draw a clusters sample according to a SI design
# Zone is the clustering variable
data(Lucy)
attach(Lucy)
summary(Zone)
# The population of clusters
UI<-c("A","B","C","D","E")
NI=length(UI)
# The sample size
nI=2
# Draws a simple random sample of two clusters
samI<-S.SI(NI,nI)
dataI<-UI[samI]
dataI   
# The information about each unit in the cluster is saved in Lucy1 and Lucy2
data(Lucy)
Lucy1<-Lucy[which(Zone==dataI[1]),]
Lucy2<-Lucy[which(Zone==dataI[2]),]
LucyI<-rbind(Lucy1,Lucy2)
attach(LucyI)
# The clustering variable is Zone
Cluster <- as.factor(as.integer(Zone))
# The variables of interest are: Income, Employees and Taxes
# This information is stored in a data frame called estima
estima <- data.frame(Income, Employees, Taxes)
Ty<-T.SIC(estima,Cluster)
# Estimation of the Population total
E.SI(NI,nI,Ty)



