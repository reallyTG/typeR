library(copula)


### Name: matrix_tools
### Title: Tools to Work with Matrices
### Aliases: p2P P2p getSigma extremePairs
### Keywords: array manip

### ** Examples

## display the definitions
p2P
P2p
extremePairs

param <- (2:7)/10
tC <- tCopula(param, dim = 4, dispstr = "un", df = 3)
## consistency of the three functions :
P <- p2P(param) # (using the default 'd')
stopifnot(identical(param, P2p(P)),
	  identical(P, getSigma(tC)))

## Toeplitz case:
(tCt <- tCopula((2:6)/10, dim = 6, disp = "toep"))
(rhoP <- tCt@getRho(tCt))
stopifnot(identical(getSigma (tCt),
		    toeplitz (c(1, rhoP))))

## "AR1" case:
nC.7 <- normalCopula(0.8, dim = 7, dispstr = "ar1")
(Sar1.7 <- getSigma(nC.7))
0.8^(0:(7-1)) #  1  0.8  0.64  0.512 ..
stopifnot(all.equal(Sar1.7, toeplitz(0.8^(0:(7-1)))))



