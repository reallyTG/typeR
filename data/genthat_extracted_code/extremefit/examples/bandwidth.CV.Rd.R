library(extremefit)


### Name: bandwidth.CV
### Title: Choice of the bandwidth by cross validation.
### Aliases: bandwidth.CV

### ** Examples

#Generate the data
theta <- function(t){
   0.5+0.25*sin(2*pi*t)
 }
n <- 5000
t <- 1:n/n
Theta <- theta(t)
Data <- NULL
for(i in 1:n){
   Data[i] <- rparetomix(1, a = 1/Theta[i], b = 1/Theta[i]+5, c = 0.75)
 }

#compute the cross validation bandwidth
Tgrid <- seq(0, 1, 0.02) #define a grid to perform the cross validation
hgrid <- bandwidth.grid(0.1, 0.3, 20) #define a grid of bandwidths
## Not run: 
##D  #For computation time purpose
##D   Hcv <- bandwidth.CV(Data, t, Tgrid, hgrid, pcv = 0.99, plot = TRUE)
##D   #The computing time can be long
##D   Hcv
## End(Not run)





