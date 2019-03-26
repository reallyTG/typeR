library(phytotools)


### Name: fitEP
### Title: Fit PE or RLC data to Eilers and Peeters 1988
### Aliases: fitEP

### ** Examples


####   Single PE dataset example    ####

PAR <- c(5,10,20,50,100,150,250,400,800,1200) #umol m-2 s-1
Pc  <- c(1.02,1.99,3.85,9.2,15.45,21.3,28.8,34.5,39.9,38.6) #mg C m-3 hr-1

myfit <- fitEP(PAR, Pc)

#Plot input data
plot(PAR, Pc, xlim=c(0,1500), ylim=c(0,40), xlab="PAR", ylab="Pc")

#Add model fit
E <- seq(0,1500,by=1)
with(myfit,{
  P <- E/((1/(alpha[1]*eopt[1]^2))*E^2+(1/ps[1]-2/(alpha[1]*eopt[1]))*E+(1/alpha[1]))
  lines(E,P)
})


####   Multiple RLC dataset example    ####

data('rlcs') 

names(rlcs) #id is unique to a given RLC

id <- unique(rlcs$id)  #Hold unique ids
n  <- length(id)       #5 unique RLCs

#Setup arrays and vectors to store data

alpha     <- array(NA,c(n,4))
eopt      <- array(NA,c(n,4))
ps        <- array(NA,c(n,4))
ssr       <- rep(NA,n)
residuals <- array(NA,c(n,11))   

#Loop through individual RLCs

for (i in 1:n){
  
  #Get ith data
  PAR  <- rlcs$PAR[rlcs$id==id[i]]
  FqFm <- rlcs$FqFm[rlcs$id==id[i]]
  
  #Call function
  myfit <- fitEP(PAR,FqFm,normalize=TRUE)
  
  #Store data
  alpha[i,]     <- myfit$alpha
  eopt[i,]      <- myfit$eopt
  ps[i,]        <- myfit$ps
  ssr[i]        <- myfit$ssr
  residuals[i,] <- myfit$residuals
  
}





