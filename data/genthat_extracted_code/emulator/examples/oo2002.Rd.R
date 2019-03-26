library(emulator)


### Name: OO2002
### Title: Implementation of the ideas of Oakley and O'Hagan 2002
### Aliases: OO2002 oo2002 cond.sample var.conditional
### Keywords: models

### ** Examples



     # Now we use the functions.  First we set up some design points:
     # Suppose we are given the toy dataset and want to know the PDF of
     # fourth power of the response at point x, where uncertainty in x
     # may be represented as it being drawn from a normnl distribution
     # with mean c(0.5,0.5,...,0.5) and a variance of 0.001.

data(toy)
val <- toy
real.relation <- function(x){sum( (0:6)*x )}
H <- regressor.multi(val)
d <- apply(H,1,real.relation)

     # and some scales (which are assumed to be known):
fish <- rep(1,6)
fish[6] <- 4

     # And determine A and Ainv:
A <- corr.matrix(val,scales=fish)
Ainv <- solve(A)

     # and add some suitably correlated Gaussian noise:
d.noisy <-  as.vector(rmvnorm(n=1, mean=d, 0.1*A))
names(d.noisy) <- names(d)

     # Now some simulation design points.  Choose n'=6:
xdash <-  matrix(runif(36),ncol=6)

     # And just for fun, we insert a near-useless seventh simulation
     # design point (it is nearly useless because it is a near copy of
     # the sixth).  We do this in order to test the coding:
xdash <- rbind(xdash,xdash[6,] + 1e-4)
colnames(xdash) <- colnames(val)
rownames(xdash) <- c("alpha","beta","gamma","delta","epsilon","zeta","zeta.copy")

     # Print the variance matrix:
(vm <- var.conditional(x=xdash,xold=val,d=d.noisy,A=A,Ainv=Ainv,scales=fish))
     # Note that the sixth and seventh columns are almost identical
     # (and so, therefore, are the sixth and seventh rows) as
     # expected.

     # Also, the final eigenvalue of vm should be small:
eigen(vm)$values


     # Now sample from the conditional t-distribution.  Taking n=3 samples:
(cs <- cond.sample(n=3, x=xdash, xold=val, d=d.noisy, A=A, Ainv=Ainv,
                   scales = fish, func = regressor.basis))

     # Note the last two columns are nearly identical, as expected.

     # Just as a test, what is the variance matrix at the design points?
(vc <- var.conditional(x=val,xold=val,d=d.noisy,A=A,Ainv=Ainv,scales=fish))
     # (This should be exactly zero);
max(eigen(vc)$values)
     # should be small

     # Next, we apply the methods of OO2002 using Monte Carlo techniques.
     # We will generate  10 different versions of eta:
number.of.eta <- 10

     # And, for each eta,  we will sample from the posterior t distribution 11 times:
number.of.X <- 11


     # create an augmented design matrix, of the design points plus the
     # simulated design points:
design.augmented <- rbind(val,xdash)
A.augmented <- corr.matrix(design.augmented, scales=fish)
Ainv.augmented <- solve(A.augmented)

out <- NULL
for(i in seq_len(number.of.eta)){
        # Create random data by sampling from the conditional
        # multivariate t at the simulated design points xdash, from
        # the t-distribution given the data d:
   ddash <- cond.sample(n=1, x=xdash, xold=val, d=d.noisy, Ainv=Ainv, scales=fish)

        # Now use the emulator to calculate m^* at points chosen from
        # the PDF of X:
   jj <-
     interpolant.quick(x=rmvnorm(n=number.of.X,rep(0.5,6),diag(6)/1000),
                       d=c(d.noisy,ddash),
                       xold=design.augmented,
                       Ainv=Ainv.augmented,
                       scales=fish)
   out <- c(out,jj)
}

   # histogram of the fourth power:
hist(out^4, col="gray")
   # See oo2002 for another example of cond.sample() in use



