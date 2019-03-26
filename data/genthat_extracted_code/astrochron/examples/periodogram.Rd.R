library(astrochron)


### Name: periodogram
### Title: Simple periodogram
### Aliases: periodogram

### ** Examples

# ***** PART 1: Demonstrate the impact of tapering
# generate example series with 10 periods: 100, 40, 29, 21, 19, 14, 10, 5, 4 and 3 ka.
ex=cycles(c(1/100,1/40,1/29,1/21,1/19,1/14,1/10,1/5,1/4,1/3),amp=c(1,.75,0.01,.5,.25,
             0.01,0.1,0.05,0.001,0.01))

# set zero padding amount for spectral analyses 
# (pad= 1 results in no zero padding, pad = 2 will pad the series to two times its original length)
# start with pad = 1, then afterwards evaluate pad=2
pad=1

# calculate the periodogram with no tapering applied (a "rectangular window")
res=periodogram(ex,output=1,padfac=pad)

# save the frequency grid and the power for plotting
freq=res[1]
pwr_rect=res[3]

# now compare with results obtained after applying four different tapers: 
#  Hann, 30% cosine taper, DPSS with a time-bandwidth product of 1, and DPSS 
#  with a time-bandwidth product of 3
pwr_hann=periodogram(hannTaper(ex,demean=FALSE),output=1,padfac=pad)[3]
pwr_cos=periodogram(cosTaper(ex,p=.3,demean=FALSE),output=1,padfac=pad)[3]
pwr_dpss1=periodogram(dpssTaper(ex,tbw=1,demean=FALSE),output=1,padfac=pad)[3]
pwr_dpss3=periodogram(dpssTaper(ex,tbw=3,demean=FALSE),output=1,padfac=pad)[3]

# now plot the results
ymin=min(rbind (log(pwr_rect[,1]),log(pwr_hann[,1]),log(pwr_cos[,1]),log(pwr_dpss1[,1]),
          log(pwr_dpss3[,1]) ))
ymax=max(rbind (log(pwr_rect[,1]),log(pwr_hann[,1]),log(pwr_cos[,1]),log(pwr_dpss1[,1]),
          log(pwr_dpss3[,1]) ))

pl(2)
plot(freq[,1],log(pwr_rect[,1]),type="l",ylim=c(ymin,ymax),lwd=2,ylab="log(Power)",
      xlab="Frequency (cycles/ka)",
      main="Comparison of rectangle (black), cosine (blue) and Hann (orange) taper",
      cex.main=1)
lines(freq[,1],log(pwr_hann[,1]),col="orange",lwd=2)
lines(freq[,1],log(pwr_cos[,1]),col="blue")
points(c(1/100,1/40,1/29,1/21,1/19,1/14,1/10,1/5,1/4,1/3),rep(ymax,10),cex=.5,
       col="purple")

plot(freq[,1],log(pwr_rect[,1]),type="l",ylim=c(ymin,ymax),lwd=2,ylab="log(Power)",
      xlab="Frequency (cycles/ka)",
      main="Comparison of rectangle (black), 1pi DPSS (green) and 3pi DPSS (red) taper",
      cex.main=1)
lines(freq[,1],log(pwr_dpss1[,1]),col="green")
lines(freq[,1],log(pwr_dpss3[,1]),col="red",lwd=2)
points(c(1/100,1/40,1/29,1/21,1/19,1/14,1/10,1/5,1/4,1/3),rep(ymax,10),cex=.5,
       col="purple")


# ***** PART 2: Now add a very small amount of red noise to the series 
#               (with lag-1 correlation = 0.5)
ex2=ex
ex2[2]=ex2[2]+ar1(rho=.5,dt=1,npts=500,sd=.005,genplot=FALSE)[2]

# compare the original series with the series+noise
pl(2)
plot(ex,type="l",lwd=2,lty=3,col="black",xlab="time (ka)",ylab="signal",
      main="signal (black dotted) and signal+noise (red)"); lines(ex2,col="red")
plot(ex[,1],ex2[,2]-ex[,2],xlab="time (ka)",ylab="difference",
      main="Difference between the two time series (very small!)")

# calculate the periodogram with no tapering applied (a "rectangular window")
res.2=periodogram(ex2,output=1,padfac=pad)

# save the frequency grid and the power for plotting
freq.2=res.2[1]
pwr_rect.2=res.2[3]

# now compare with results obtained after applying four different tapers: 
#  Hann, 30% cosine taper, DPSS with a time-bandwidth product of 1, and DPSS 
#  with a time-bandwidth product of 3
pwr_hann.2=periodogram(hannTaper(ex2,demean=FALSE),output=1,padfac=pad)[3]
pwr_cos.2=periodogram(cosTaper(ex2,p=.3,demean=FALSE),output=1,padfac=pad)[3]
pwr_dpss1.2=periodogram(dpssTaper(ex2,tbw=1,demean=FALSE),output=1,padfac=pad)[3]
pwr_dpss3.2=periodogram(dpssTaper(ex2,tbw=3,demean=FALSE),output=1,padfac=pad)[3]

# now plot the results
ymin=min(rbind (log(pwr_rect.2[,1]),log(pwr_hann.2[,1]),log(pwr_cos.2[,1]),
         log(pwr_dpss1.2[,1]),log(pwr_dpss3.2[,1]) ))
ymax=max(rbind (log(pwr_rect.2[,1]),log(pwr_hann.2[,1]),log(pwr_cos.2[,1]),
         log(pwr_dpss1.2[,1]),log(pwr_dpss3.2[,1]) ))

pl(2)
plot(freq.2[,1],log(pwr_rect.2[,1]),type="l",ylim=c(ymin,ymax),lwd=2,ylab="log(Power)",
     xlab="Frequency (cycles/ka)",
     main="Comparison of rectangle (black), cosine (blue) and Hann (orange) taper",
     cex.main=1)
lines(freq.2[,1],log(pwr_hann.2[,1]),col="orange",lwd=2)
lines(freq.2[,1],log(pwr_cos.2[,1]),col="blue")
points(c(1/100,1/40,1/29,1/21,1/19,1/14,1/10,1/5,1/4,1/3),rep(ymax,10),cex=.5,
        col="purple")

plot(freq.2[,1],log(pwr_rect.2[,1]),type="l",ylim=c(ymin,ymax),lwd=2,ylab="log(Power)",
      xlab="Frequency (cycles/ka)",
      main="Comparison of rectangle (black), 1pi DPSS (green) and 3pi DPSS (red) taper",
      cex.main=1)
lines(freq.2[,1],log(pwr_dpss1.2[,1]),col="green")
lines(freq.2[,1],log(pwr_dpss3.2[,1]),col="red",lwd=2)
points(c(1/100,1/40,1/29,1/21,1/19,1/14,1/10,1/5,1/4,1/3),rep(ymax,10),cex=.5,
      col="purple")

# ***** PART 3: Return to PART 1, but this time increase the zero padding to 2 (pad=2)



