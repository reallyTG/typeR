library(sommer)


### Name: adiag1
### Title: Binds arrays corner-to-corner
### Aliases: adiag1
### Keywords: array

### ** Examples

 a <- array( 1,c(2,2))
 b <- array(-1,c(2,2))
 adiag1(a,b)

 ## dropped dimensions can count:

 b2 <- b1 <- b
 dim(a) <- c(2,1,2)
 dim(b1) <- c(2,2,1)
 dim(b2) <- c(1,2,2)

 dim(adiag1(a,b1))
 dim(adiag1(a,b2))

## dimnames are preserved if not null:

a <- matrix(1,2,2,dimnames=list(col=c("red","blue"),size=c("big","small"))) 
b <- 8
dim(b) <- c(1,1)
dimnames(b) <- list(col=c("green"),size=c("tiny"))
adiag1(a,b)   #dimnames preserved
adiag1(a,8)   #dimnames lost because second argument has none.

## non scalar values for pad can be confusing:
q <- matrix(0,3,3)
adiag1(q,q,pad=1:4)

## following example should make the pattern clear:
adiag1(q,q,pad=1:36)


# Now, a use for arrays with dimensions of zero extent:
z <- array(dim=c(0,3))
colnames(z) <- c("foo","bar","baz")

adiag1(a,z)        # Observe how this has
                  # added no (ie zero) rows to "a" but
                  # three extra columns filled with the pad value

adiag1(a,t(z))
adiag1(z,t(z))     # just the pad value




