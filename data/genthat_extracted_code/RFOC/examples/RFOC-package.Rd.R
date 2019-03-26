library(RFOC)


### Name: RFOC-package
### Title: Calculates and plot Earthquake Focal Mechanisms
### Aliases: RFOC-package RFOC
### Keywords: package

### ** Examples


#############  plot one focal mechanism:
M = SDRfoc(-25, 34, 16,u = FALSE, ALIM = c(-1, -1, +1, +1), PLOT=TRUE)


#############  plot many P-axes:
paz = rnorm(100, mean=297, sd=100)
pdip = rnorm(100, mean=52, sd=20)
net()
focpoint(paz, pdip, col='red',  pch=3, lab="", UP=FALSE)

#############

#### Show many Focal mechanisms on a plot:

Z1 = c(159.33,51.6,206,18,78,
161.89,54.5,257,27,133,
170.03,53.57,-44,13,171,
154.99,50.16,-83,19,-40,
151.09,47.15,123,23,-170,
176.31,51.41,-81,22,122,
153.71,46.63,205,28,59,
178.39,51.21,-77,16,126,
178.27,51.1,-86,15,115,
177.95,51.14,-83,25,126,
178.25,51.18,215,16,27
)

MZ = matrix(Z1, ncol=5, byrow=TRUE)

plot(MZ[,1], MZ[,2], type='n', xlab="LON", ylab="LAT", asp=1)

for(i in 1:length(MZ[,1]))
{
paste(MZ[i,3], MZ[i,4], MZ[i,5])


MEC =  SDRfoc(MZ[i,3], MZ[i,4], MZ[i,5], u=FALSE, ALIM=c(-1,-1, +1, +1), PLOT=FALSE)
fcol =  foc.color(foc.icolor(MEC$rake1), pal=1)
justfocXY(MEC, x=MZ[i,1], y =MZ[i,2] , focsiz=0.5, fcol =fcol , fcolback = "white", xpd = TRUE)


}






