library(HotDeckImputation)


### Name: match.d_r_odd
### Title: Donor-Recipient Matching via Optimal Donor Distribution Method
### Aliases: match.d_r_odd
### Keywords: optimize

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)

#Set up a random distance matrix
   ndonor=20
   nrecip=20
   distance<-matrix(sample(1:100,replace=TRUE,size=ndonor*nrecip),nrow=ndonor,ncol=nrecip)
#Name donors and recipients
   donors<-1:nrow(distance)
   recipients<-(nrow(distance)+1):(nrow(distance)+ncol(distance))
   colnames(distance)<-recipients
   rownames(distance)<-donors
#Set up the donor limit variable
   donor_limit<-rep(1,length(donors))

#perform the matching
match.d_r_odd(distance=distance,recipients=recipients,donors=donors,
   donor_limit=donor_limit)



