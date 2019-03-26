# BTbad.R -- inadmissible bounds to
# see if Rvmmin with keepinputpar = TRUE stops.
if (! require(Rvmmin) ) stop("Need to install Rvmmin")
#####################
# Simple bounds and masks test
bt.f<-function(x){
 sum(x*x)
}

bt.g<-function(x){
  gg<-2.0*x
}

n<-10
xx <- rep(0,n) # the start which is out of bounds
lower <- rep(1,n)
upper <- rep(3,n)
bdmsk <- rep(1,n) # all free parameters
ansbt <- try( Rvmmin(xx, bt.f, bt.g, lower, upper, bdmsk, 
         control=list(trace=1, keepinputpar = TRUE)) )
if (class(ansbt) == "try-error") {
   cat("Successful stop when out of bounds\n")
} else { print(ansbt) }


xx2 <- rep(2,n) # the start which is out of bounds
ansbt2 <- try( Rvmmin(xx2, bt.f, bt.g, lower, upper, bdmsk, 
         control=list(trace=1, keepinputpar = TRUE)) )
if (class(ansbt2) == "try-error") {
   cat("Successful stop when out of bounds\n")
} else { print(ansbt2) }

