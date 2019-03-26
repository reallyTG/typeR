library(Matrix)


### Name: nearPD
### Title: Nearest Positive Definite Matrix
### Aliases: nearPD
### Keywords: algebra array

### ** Examples

 ## Higham(2002), p.334f - simple example
 A <- matrix(1, 3,3); A[1,3] <- A[3,1] <- 0
 n.A <- nearPD(A, corr=TRUE, do2eigen=FALSE)
 n.A[c("mat", "normF")]
 stopifnot(all.equal(n.A$mat[1,2], 0.760689917),
	   all.equal(n.A$normF, 0.52779033, tolerance=1e-9) )

 set.seed(27)
 m <- matrix(round(rnorm(25),2), 5, 5)
 m <- m + t(m)
 diag(m) <- pmax(0, diag(m)) + 1
 (m <- round(cov2cor(m), 2))

 str(near.m <- nearPD(m, trace = TRUE))
 round(near.m$mat, 2)
 norm(m - near.m$mat) # 1.102 / 1.08

 if(require("sfsmisc")) {
    m2 <- posdefify(m) # a simpler approach
    norm(m - m2)  # 1.185, i.e., slightly "less near"
 }

 round(nearPD(m, only.values=TRUE), 9)

## A longer example, extended from Jens' original,
## showing the effects of some of the options:

pr <- Matrix(c(1,     0.477, 0.644, 0.478, 0.651, 0.826,
               0.477, 1,     0.516, 0.233, 0.682, 0.75,
               0.644, 0.516, 1,     0.599, 0.581, 0.742,
               0.478, 0.233, 0.599, 1,     0.741, 0.8,
               0.651, 0.682, 0.581, 0.741, 1,     0.798,
               0.826, 0.75,  0.742, 0.8,   0.798, 1),
             nrow = 6, ncol = 6)

nc.  <- nearPD(pr, conv.tol = 1e-7) # default
nc.$iterations  # 2
nc.1 <- nearPD(pr, conv.tol = 1e-7, corr = TRUE)
nc.1$iterations # 11 / 12 (!)
ncr   <- nearPD(pr, conv.tol = 1e-15)
str(ncr)# still 2 iterations
ncr.1 <- nearPD(pr, conv.tol = 1e-15, corr = TRUE)
ncr.1 $ iterations # 27 / 30 !

ncF <- nearPD(pr, conv.tol = 1e-15, conv.norm = "F")
stopifnot(all.equal(ncr, ncF))# norm type does not matter at all in this example

## But indeed, the 'corr = TRUE' constraint did ensure a better solution;
## cov2cor() does not just fix it up equivalently :
norm(pr - cov2cor(ncr$mat)) # = 0.09994
norm(pr -       ncr.1$mat)  # = 0.08746 / 0.08805

### 3) a real data example from a 'systemfit' model (3 eq.):
(load(system.file("external", "symW.rda", package="Matrix"))) # "symW"
dim(symW) #  24 x 24
class(symW)# "dsCMatrix": sparse symmetric
if(dev.interactive())  image(symW)
EV <- eigen(symW, only=TRUE)$values
summary(EV) ## looking more closely {EV sorted decreasingly}:
tail(EV)# all 6 are negative
EV2 <- eigen(sWpos <- nearPD(symW)$mat, only=TRUE)$values
stopifnot(EV2 > 0)
if(require("sfsmisc")) {
       plot(pmax(1e-3,EV), EV2, type="o", log="xy", xaxt="n",yaxt="n")
       eaxis(1); eaxis(2)
} else plot(pmax(1e-3,EV), EV2, type="o", log="xy")
abline(0,1, col="red3",lty=2)




