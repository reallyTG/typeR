library(surveillance)


### Name: sts_creation
### Title: Function for simulating a time series
### Aliases: sts_creation

### ** Examples

set.seed(12345)
# Time series parameters
scenario4 <- c(1.6,0,0.4,0.5,2)
theta <- 1.6
beta <- 0
gamma1 <-0.4
gamma2 <- 0.5
overdispersion <- 1
m <- 1
# Dates
firstDate <- "2006-01-01"
lengthT=350
dates <- as.Date(firstDate,origin='1970-01-01') + 7 * 0:(lengthT - 1)
# Maximal delay in weeks
D=10
# Dates and sizes of the outbreaks
datesOutbreak <- c(as.Date("2008-03-30"),as.Date("2011-09-25",origin="1970-01-01"))
sizesOutbreak <- c(2,5)
# Delay distribution
data("salmAllOnset")
in2011 <- which(formatDate(epoch(salmAllOnset), "%G") == 2011)
rT2011 <- salmAllOnset@control$reportingTriangle$n[in2011,]
densityDelay <- apply(rT2011,2,sum, na.rm=TRUE)/sum(rT2011, na.rm=TRUE)
# alpha for the upperbound
alpha <- 0.05
# Create the sts with the full time series
stsSim <- sts_creation(theta=theta,beta=beta,gamma1=gamma1,gamma2=gamma2,m=m,
                       overdispersion=overdispersion,
                       dates=dates,
                       sizesOutbreak=sizesOutbreak,datesOutbreak=datesOutbreak,
                       delayMax=D,densityDelay=densityDelay,
                       alpha=alpha)
plot(stsSim)



