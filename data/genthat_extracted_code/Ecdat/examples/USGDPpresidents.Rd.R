library(Ecdat)


### Name: USGDPpresidents
### Title: US GDP per capita with presidents and wars
### Aliases: USGDPpresidents
### Keywords: datasets

### ** Examples

##
## GDP, Presidents and Wars 
##
data(USGDPpresidents)
(wars <- levels(USGDPpresidents$war))
nWars <- length(wars)
plot(realGDPperCapita/1000~Year, 
     USGDPpresidents, log='y', type='l', 
     ylab='average annual income (K$)', 
     las=1)     
abline(v=c(1929, 1933, 1945), lty='dashed')
text(1930, 2.5, "Hoover", srt=90, cex=0.9)
text(1939.5, 30, 'FDR', srt=90, cex=1.1, col='blue')

# label wars
(logGDPrange <- log(range(USGDPpresidents$realGDPperCapita, 
                    na.rm=TRUE)/1000))
(yrRange <- range(USGDPpresidents$Year))
(yrMid <- mean(yrRange))
for(i in 2:nWars){
  w <- wars[i]
  sel <- (USGDPpresidents$war==w)
  yrs <- range(USGDPpresidents$Year[sel])
  abline(v=yrs, lty='dotted', col='grey')
  yr. <- mean(yrs)
  w.adj <- (0.5 - 0.6*(yr.-yrMid)/diff(yrRange))
  logy <- (logGDPrange[1]+w.adj*diff(logGDPrange))
  y. <- exp(logy)
  text(yr., y., w, srt=90, col='red', cex=0.5)
}

##
## CPI v. GDPdeflator
## 
plot(GDPdeflator~CPI, USGDPpresidents, type='l', 
     log='xy')
     
##
## Unemployment 
##
plot(unemployment~Year, USGDPpresidents, type='l')




