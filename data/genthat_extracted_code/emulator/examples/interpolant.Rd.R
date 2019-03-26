library(emulator)


### Name: interpolant
### Title: Interpolates between known points using Bayesian estimation
### Aliases: interpolant interpolant.quick int.qq
### Keywords: models

### ** Examples

# example has 10 observations on 6 dimensions.
# function is just sum( (1:6)*x) where x=c(x_1, ... , x_2)

data(toy)
val <- toy
real.relation <- function(x){sum( (0:6)*x )}
H <- regressor.multi(val)
d <- apply(H,1,real.relation)
d <- jitter(d,amount=1e-5)    # to prevent numerical problems

fish <- rep(1,6)
fish[6] <- 4

A <- corr.matrix(val,scales=fish)
Ainv <- solve(A)

# now add some suitably correlated noise to d:
d.noisy <-  as.vector(rmvnorm(n=1, mean=d, 0.1*A))
names(d.noisy) <- names(d)

# First try a value at which we know the answer (the first row of val):
x.known <- as.vector(val[1,])
bayes.known <- interpolant(x.known, d, val, Ainv=Ainv, scales=fish, g=FALSE)
print("error:")
print(d[1]-bayes.known)


# Now try the same value, but with noisy data:
print("error:")
print(d.noisy[1]-interpolant(x.known, d.noisy, val, Ainv=Ainv, scales=fish, g=FALSE))

#And now one we don't know:
x.unknown <- rep(0.5 , 6)
bayes.unknown <- interpolant(x.unknown, d.noisy, val, scales=fish, Ainv=Ainv,g=TRUE)

## [   compare with the "true" value of sum(0.5*0:6) = 10.5   ]



# Just a quickie for int.qq():
int.qq(x=rbind(x.unknown,x.unknown+0.1),d.noisy,val,Ainv,pos.def.matrix=diag(fish))


## (To find the best correlation lengths, use optimal.scales())

 # Now we use the SAME dataset but a different set of basis functions.
 # Here, we use the functional dependence of
 # "A+B*(x[1]>0.5)+C*(x[2]>0.5)+...+F*(x[6]>0.5)".
 # Thus the basis functions will be c(1,x>0.5).
 # The coefficients will again be 1:6.

       # Basis functions:
f <- function(x){c(1,x>0.5)}
       # (other examples might be
       # something like  "f <- function(x){c(1,x>0.5,x[1]^2)}"

       # now create the data
real.relation2 <- function(x){sum( (0:6)*f(x) )}
d2 <- apply(val,1,real.relation2)

       # Define a point at which the function's behaviour is not known:
x.unknown2 <- rep(1,6)
       # Thus real.relation2(x.unknown2) is sum(1:6)=21

       # Now try the emulator:
interpolant(x.unknown2, d2, val, Ainv=Ainv, scales=fish, g=TRUE)$mstar.star
       # Heh, it got it wrong!  (we know that it should be 21)


       # Now try it with the correct basis functions:
interpolant(x.unknown2, d2, val, Ainv=Ainv,scales=fish, func=f,g=TRUE)$mstar.star
       # That's more like it.

       # We can tell that the coefficients are right by:
betahat.fun(val,Ainv,d2,func=f)
       # Giving c(0:6), as expected.

       # It's interesting to note that using the *wrong* basis functions
       # gives the *correct* answer when evaluated at a known point:
interpolant(val[1,], d2, val, Ainv=Ainv,scales=fish, g=TRUE)$mstar.star
real.relation2(val[1,])
       # Which should agree.


       # Now look at Z.  Define a function Z() which determines the
       # standard deviation at a point near a known point.
Z <- function(o) {
    x <- x.known 
    x[1] <- x[1]+ o
    interpolant(x, d.noisy, val, Ainv=Ainv, scales=fish, g=TRUE)$Z
  } 

Z(0)       #should be zero because we know the answer (this is just Z at x.known)
Z(0.1)     #nonzero error.


  ## interpolant.quick() should  give the same results faster, but one
  ##   needs a matrix:
u <- rbind(x.known,x.unknown)
interpolant.quick(u, d.noisy, val, scales=fish, Ainv=Ainv,g=TRUE)




# Now an example from climate science.  "results.table" is a dataframe
# of goldstein (a climate model) results.  Each of its 100 rows shows a
# point in parameter space together with certain key outputs from the
# goldstein program.  The following R code shows how we can set up an
# emulator based on the first 27 goldstein runs, and use the emulator to
# predict the output for the remaining 73 goldstein runs.  The results
# of the emulator are then plotted on a scattergraph showing that the
# emulator is producing estimates that are close to the "real" goldstein
# runs.


data(results.table)
data(expert.estimates)

       # Decide which column we are interested in:
output.col <- 26

       # extract the "important" columns:
wanted.cols <- c(2:9,12:19)

       # Decide how many to keep;
       # 30-40 is about the most we can handle:
wanted.row <- 1:27

       # Values to use are the ones that appear in goin.test2.comments:
val <- results.table[wanted.row , wanted.cols]

       # Now normalize val so that 0<results.table[,i]<1 is 
       # approximately true for all i:

normalize <- function(x){(x-mins)/(maxes-mins)}
unnormalize <- function(x){mins + (maxes-mins)*x}

mins  <- expert.estimates$low 
maxes <- expert.estimates$high
jj <- t(apply(val,1,normalize))

jj <- as.data.frame(jj) 
names(jj) <- names(val)
val <- jj


       ## The value we are interested in  is the 19th (or 20th or ... or 26th) column.
d  <- results.table[wanted.row ,  output.col]

       ##  Now some scales, estimated earlier from the data using
       ##   optimal.scales():

scales.optim <- exp(c( -2.917, -4.954, -3.354, 2.377, -2.457, -1.934, -3.395,
-0.444, -1.448, -3.075, -0.052, -2.890, -2.832, -2.322, -3.092, -1.786))

A <- corr.matrix(val,scales=scales.optim, method=2)
Ainv <-  solve(A)

print("and plot points used in optimization:")
d.observed <- results.table[ , output.col]

A <- corr.matrix(val,scales=scales.optim, method=2)
Ainv <- solve(A)

print("now plot all points:")
design.normalized <- as.matrix(t(apply(results.table[,wanted.cols],1,normalize)))
d.predicted <- interpolant.quick(design.normalized , d , val , Ainv=Ainv,
scales=scales.optim)
jj <- range(c(d.observed,d.predicted))
par(pty="s")
plot(d.observed, d.predicted, pch=16, asp=1,
xlim=jj,ylim=jj,
xlab=expression(paste(temperature," (",{}^o,C,"), model"   )),
ylab=expression(paste(temperature," (",{}^o,C,"), emulator"))
)
abline(0,1)



