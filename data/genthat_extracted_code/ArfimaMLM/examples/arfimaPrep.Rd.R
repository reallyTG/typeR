library(ArfimaMLM)


### Name: arfimaPrep
### Title: Preparing a dataset for subsequent analysis accoring to the
###   Arfima-MLM/Arfima-OLS framework
### Aliases: arfimaPrep
### Keywords: ts manip

### ** Examples

require(fractal)
require(fracdiff)

### set basic parameters for simulation
t = 100 # number of time points
n = 500 # number of observations within time point
N = t*n # total number of observations

### generate fractional ARIMA Time Series for y_t, x1_t, z1_t, z2_t
set.seed(123)
y_t <- fracdiff.sim(t, d=0.4, mu=10)$series
x1_t <- fracdiff.sim(t, d=0.3, mu=5)$series
z1_t <- fracdiff.sim(t, d=0.1, mu=2)$series
z2_t <- fracdiff.sim(t, d=0.25, mu=3)$series

### simulate data
data <- NULL; data$time <- rep(seq(1:t),each=n)
data <- data.frame(data)
data$x1 <- rnorm(N,rep(x1_t,each=n),2)
data$x2 <- rnorm(N,0,40)
data$z1 <- rnorm(N,rep(z1_t,each=n),3)
data$z2 <- rep(z2_t,each=n)
b1 <- 0.2+rep(rnorm(t,0,0.1),each=n)
data$y <- (b1*data$x1-0.05*data$x2+0.3*rep(z1_t,each=n)
            +0*data$z2+rnorm(N,rep(y_t,each=n),1))


### prepare datasets for model estimation

# basic example
dat1 <- arfimaPrep(data = data, timevar="time"
                   , varlist.mean = c("y","x1","z1","z2")
                   , varlist.fd = c("y", "z1","z2")
                   , varlist.xdif = "x1", varlist.ydif = "y")
                   
# including error correction mechanism
# change estimation method for differencing parameter for all variables
dat2 <- arfimaPrep(data = data, timevar="time"
                   , varlist.mean = c("y","x1","z1","z2")
                   , varlist.fd = c("y", "z1","z2")
                   , varlist.xdif = "x1", varlist.ydif = "y"
                   , d = "ML", ecmformula = y.mean ~ x1.mean
                   , decm="Sperio")
                   
# vary estimation method for differencing parameter between variables
# specify AR/MA models                   
dat3 <- arfimaPrep(data = data, timevar="time"
                   , varlist.mean = c("y","x1","z1","z2")
                   , varlist.fd = c("y", "z1","z2")
                   , varlist.xdif = "x1", varlist.ydif = "y"
                   , d=list(y="ML", z1="Sperio", z2=0.25)
                   , arma=list(y=c(1,0),z2=c(0,1)))

# specify AR/MA models while holding AR[2] fixed for y
dat4 <- arfimaPrep(data = data, timevar="time"
                   , varlist.mean = c("y","x1","z1","z2")
                   , varlist.fd = c("y", "z1","z2")
                   , varlist.xdif = "x1", varlist.ydif = "y"
                   , arma=list(y=list(c(1,3),0),z2=c(0,1)))                   

ls(dat1)
head(dat1$mean)
head(dat2$merged)
dat3$arma



