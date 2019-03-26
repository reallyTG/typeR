hobbs.f<- function(x){ # # Hobbs weeds problem -- function
    if (abs(12*x[3]) > 500) { # check computability
       fbad<-.Machine$double.xmax
       return(fbad)
    }
    res<-hobbs.res(x)
    f<-sum(res*res)
}
hobbs.res<-function(x){ # Hobbs weeds problem -- residual
# This variant uses looping
    if(length(x) != 3) stop("hobbs.res -- parameter vector n!=3")
    y<-c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
         38.558, 50.156, 62.948, 75.995, 91.972)
    t<-1:12
    if(abs(12*x[3])>50) {
       res<-rep(Inf,12)
    } else {
       res<-x[1]/(1+x[2]*exp(-x[3]*t)) - y
    }
}

hobbs.jac<-function(x){ # Jacobian of Hobbs weeds problem
   jj<-matrix(0.0, 12, 3)
   t<-1:12
    yy<-exp(-x[3]*t)
    zz<-1.0/(1+x[2]*yy)
     jj[t,1] <- zz
     jj[t,2] <- -x[1]*zz*zz*yy
     jj[t,3] <- x[1]*zz*zz*yy*x[2]*t
   return(jj)
}

hobbs.g<-function(x){ # gradient of Hobbs weeds problem
    # NOT EFFICIENT TO CALL AGAIN
    jj<-hobbs.jac(x)
    res<-hobbs.res(x)
    gg<-as.vector(2.*t(jj) %*% res)
    return(gg)
}
require(optimr)

start <- c(300, 50, .3)

# Set trace=1 for lots of output on methods
msg <- paste("opm attempt UNSCALED")
cat(msg,"\n")
mydou <- opm(start, hobbs.f, hobbs.g, method="ALL", control=list(trace=0))
summary(mydou, order=value)
msg <- paste("opm attempt SCALED")
cat(msg,"\n")
mydos <- opm(start, hobbs.f, hobbs.g, method="ALL", control=list(trace=0, parscale=c(100,10,.1)))
summary(mydos, order=value)

start <- c(1, 1, 1)
msg <- paste("Bad start: opm attempt UNSCALED")
cat(msg,"\n")
mydoux <- opm(start, hobbs.f, hobbs.g, method="ALL", control=list(trace=0))
summary(mydoux, order=value)
msg <- paste("Bad start: opm attempt SCALED")
cat(msg,"\n")
mydosx <- opm(start, hobbs.f, hobbs.g, method="ALL", control=list(trace=0, parscale=c(100,10,.1)))
summary(mydosx, order=value)



