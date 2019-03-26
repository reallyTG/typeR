library(pocrm)


### Name: getwm
### Title: Obtain the working models for use in the partial order continual
###   reassessment method (PO-CRM)
### Aliases: getwm

### ** Examples


#All specifications refer to example in Wages, Conaway and O'Quigley (2011).

#Specify the possible orderings from Table 2
orders<-matrix(nrow=8,ncol=8)
orders[1,]<-c(1,2,3,4,5,6,7,8)
orders[2,]<-c(1,3,2,4,5,6,7,8)
orders[3,]<-c(1,2,3,5,4,6,7,8)
orders[4,]<-c(1,2,3,4,5,7,6,8)
orders[5,]<-c(1,3,2,5,4,6,7,8)
orders[6,]<-c(1,3,2,4,5,7,6,8)
orders[7,]<-c(1,2,3,5,4,7,6,8)
orders[8,]<-c(1,3,2,5,4,7,6,8)

#Specify the skeleton values provided in Table 4.
skeleton<-c(0.01,0.03,0.10,0.20,0.33,0.47,0.60,0.70)

getwm(orders,skeleton) 



