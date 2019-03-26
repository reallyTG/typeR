library(phytotools)


### Name: phytoprod
### Title: Calculates phytoplantkon production.
### Aliases: phytoprod

### ** Examples


#Model incident irradiance for Lake Superior on July 31, 2007
date <- seq(ISOdatetime(2013,7,31,0,0,0,tz="UTC"),
            ISOdatetime(2013,8,1,0,0,0,tz="UTC"),
            by="10 min")

E0 <- incident(date, 47.33, -89.8, 180, -6, meanPAR=480, reflectance=TRUE)

plot(E0[,1],E0[,2],type="l")

#Model PE data 
P <- c(0.64,1.32,1.09,0.53,0.37,0.17,0.02)/24   #(umol C ug chla-1 hr-1)
E <- c(373,255,136,38.6,10.95,3.1,0.25)         #(umol m-2 s-1) 

#Fit data to Eilers and Peeters
myfit1 <- fitEP(E,P)

#Fit data to Jasbby and Platt
myfit2 <- fitJP(E,P)

#Plot PE curve
plot(E,P)
E <- c(0:400)
#Eilers and Peeters
P.EP <- E/((1/(myfit1$alpha[1]*myfit1$eopt[1]^2))*E^2+
           (1/myfit1$ps[1]-2/(myfit1$alpha[1]*myfit1$eopt[1]))*E+
           (1/myfit1$alpha[1]))
lines(E,P.EP,col="red")
#Jassby and Platt
P.JP <- myfit2$alpha[1]*myfit2$ek[1]*tanh(E/myfit2$ek[1])
lines(E,P.JP,col="blue")

#Compare Areal Primary production between two fits
#Assume constant chlorophyll through depth of 0.894 ug/L

#Eilers and Peeters
phytoprod(myfit1,
          E0,
          kpar=0.126,
          cz=matrix(data=c(1,0.894),ncol=2))$PP
#Units of umol C m-2 day-1

#Jassby and Platt
phytoprod(myfit2,
          E0,
          kpar=0.126,
          cz=matrix(data=c(1,0.894),ncol=2))$PP
#Units of umol C m-2 day-1

#Now let chlorophyll change with depth
cz <- matrix(data=c(0.462,0.699,1.065,1.332,1.245,1.156,0.636,0.558,
                    2,5,10,20,30,40,60,80),ncol=2)

myPP <- phytoprod(myfit1,
                  E0,
                  kpar=0.126,
                  cz,
                  zmax=80)

myPP$PP #Units of umol C m-2 day-1

#Plot photosynthetic rate through depth
#Units of umol C m-3 hr-1

image(x=myPP$t,
      y=myPP$z,
      z=myPP$P,
      col=rev(heat.colors(20)),
      ylim=c(80,0),
      zlim=c(1e-5,0.1),
      xlab="Decimal Day",
      ylab="Depth (m)")




