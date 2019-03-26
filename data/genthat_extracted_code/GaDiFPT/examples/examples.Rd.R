library(GaDiFPT)


### Name: examples
### Title: Example scripts and user provided functions for the Gaussian
###   Diffusion Process
### Aliases: examples Wiener Wiener1 WienerDrift OrnUhl OrnUhlCurrent
###   Logistic

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

# Wiener process through a periodic boundary: the process is built, its FPT pdf 
# evaluated by numerical quadrature and a train of crossing times is simulated. 
# Results are shown and saved to a file


library(GaDiFPT)

cat('#################################################################### \n')
cat('#####               First Passage Time Simulation              ##### \n')
cat('#####                   for the Wiener process                 ##### \n')
cat('#####                 through a periodic boundary              ##### \n')
cat('#################################################################### \n \n \n')

Wiener1 <- diffusion(c("mu","sigma2"))

mu <- 0.0
sigma2 <- 1.0

S0 <- 10
S1 <- 3
Sfr <- 0.005
Stype <- "periodic"

t0 <- 0.0
x0 <- 0.0
Tfin <- 1000    
deltat <- 0.5
N <- floor((Tfin - t0)/deltat)  
M <- 3000

quadflag <- 1
RStudioflag <- TRUE

param <- inputlist(mu,sigma2,Stype,t0,x0,Tfin,deltat,M,quadflag,RStudioflag)

fileout <- "results_Wiener1.out"

aaa <- function(t) {
  aaa <- 0.0 + 0.0*t
}

bbb <- function(t) {
 bbb <- mu + 0.0*t
}

SSS <- function(t) {
  SSS <- S0+S1*cos(Sfr*t)
}

SSSp <- function(t) {
  SSSp <- -S1*Sfr*sin(Sfr*t)
}

mp <- numeric(N+1)
up <- numeric(N+1)
vp <- numeric(N+1)
app <- numeric(N)

tempi <- seq(t0, by=deltat, length=N+1)

dum <- vectorsetup(param)
mp <- dum[,1]
up <- dum[,2]
vp <- dum[,3]

splot <- S(tempi)
mp1 <- mp - sqrt(2*sigma2)
mp2 <- mp + sqrt(2*sigma2)
matplot(tempi, cbind(mp,mp1,mp2,splot),type="l",lty=c(1,2,2,1),lwd=1,
        main="mean of the process vs. threshold",xlab="time(ms)",ylab="")
legend("bottomright",c("mean","threshold"),
       lty=c(1,1),col=c("black","blue"))


Nmax <- which.min(abs(mp[2:(N+1)]-mp[1:N]))

  N1 <- N
  if (quadflag == 0)   N1 <- max(c(Nmax,N/4))
  
  N1p1 <- N1+1

answer <- FPTdensity_byint(param,N1)
plot(answer)

spikes <- FPTsimul(answer,M)
histplot(spikes,answer)
  
res_summary(answer,M,fileout) 



