library(phytotools)


### Name: fitPGH
### Title: Fit PE or RLC data to Platt, Gallegos and Harrison 1980
### Aliases: fitPGH

### ** Examples


####   Single PE dataset example    ####

PAR <- c(5,10,20,50,100,150,250,400,800,1200) #umol m-2 s-1
Pc  <- c(1.02,1.99,3.85,9.2,15.45,21.3,28.8,34.5,39.9,38.6) #mg C m-3 hr-1

#Call function
myfit <- fitPGH(PAR, Pc)

#Plot input data
plot(PAR, Pc, xlim=c(0,1500), ylim=c(0,40), xlab="PAR", ylab="Pc")

#Add model fit
E <- seq(0,1500,by=1)
with(myfit,{
  P <- ps[1]*(1-exp(-1*alpha[1]*E/ps[1]))*exp(-1*beta[1]*E/ps[1])
  lines(E,P)
})


####   Multiple RLC dataset example    ####

data('rlcs') 

names(rlcs) #id is unique to a given RLC

id <- unique(rlcs$id)  #Hold unique ids
n  <- length(id)       #5 unique RLCs

#Setup arrays and vectors to store data

alpha     <- array(NA,c(n,4))
beta      <- array(NA,c(n,4))
ps        <- array(NA,c(n,4))
ssr       <- rep(NA,n)
residuals <- array(NA,c(n,11))  

#Loop through individual RLCs

for (i in 1:n){
  
  #Get ith data
  PAR  <- rlcs$PAR[rlcs$id==id[i]]
  FqFm <- rlcs$FqFm[rlcs$id==id[i]]
  
  #Call function
  myfit <- fitPGH(PAR,FqFm,normalize=TRUE)
  
  #Store data
  alpha[i,]     <- myfit$alpha
  beta[i,]      <- myfit$beta
  ps[i,]        <- myfit$ps
  ssr[i]        <- myfit$ssr
  residuals[i,] <- myfit$residuals
  
}




