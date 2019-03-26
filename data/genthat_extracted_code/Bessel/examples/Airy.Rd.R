library(Bessel)


### Name: Airy
### Title: Airy Functions (and Their First Derivative)
### Aliases: Airy AiryA AiryB
### Keywords: math

### ** Examples

## The AiryA() := Ai() function

curve(AiryA, -20, 100, n=1001)
curve(AiryA,  -1, 100, n=1001, log="y")
curve(AiryA(x, expon.scaled=TRUE), -1, 50, n=1001)
curve(AiryA(x, expon.scaled=TRUE),  1, 10000, n=1001, log="xy")


## The AiryB() := Bi() function
curve(AiryB, -20, 2, n=1001); abline(h=0,v=0, col="gray",lty=2)
curve(AiryB, -1, 20, n=1001, log = "y") # exponential growth (x > 0)

curve(AiryB(x,expon.scaled=TRUE), -1, 20,    n=1001)
curve(AiryB(x,expon.scaled=TRUE),  1, 10000, n=1001, log="x")



