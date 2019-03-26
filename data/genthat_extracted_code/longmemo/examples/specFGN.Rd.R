library(longmemo)


### Name: specFGN
### Title: Spectral Density of Fractional Gaussian Noise
### Aliases: specFGN B.specFGN
### Keywords: ts models

### ** Examples

 str(rg.7  <- specFGN(0.7, m = 100))
 str(rg.5  <- specFGN(0.5, m = 100))# { H = 0.5 <--> white noise ! }

 plot(rg.7) ## work around plot.spec() `bug' in R < 1.6.0
 plot(rg.5, add = TRUE, col = "blue")
 text(2, mean(rg.5$spec), "H = 0.5 [white noise]", col = "blue", adj = c(0,-1/4))
## This was the original method in longmemo, upto version 1.0-0 (incl):
 rg.7.o <- specFGN(0.7, m = 100, k.approx=NA, nsum = 200)
 ## quite accurate (but slightly slower):
 rg.7f  <- specFGN(0.7, m = 100, k.approx=NA, nsum = 10000)
 ## comparing old and new default :
 all.equal(rg.7, rg.7.o)# different in about 5th digit
 all.equal(rg.7, rg.7f )# ==> new default is *more* accurate: 1.42 e-6
## No test: 
 ## takes about  7 sec {in 2011}:
 rg.7ff <- specFGN(0.7, m = 100, k.approx=NA, nsum = 500000)
 all.equal(rg.7f, rg.7ff)# ~ 10 ^ -7
 all.equal(rg.7  $spec, rg.7ff$spec)# ~ 1.33e-6 -- Paxson is accurate!
 all.equal(rg.7.o$spec, rg.7ff$spec)# ~ 2.40e-5 -- old default is less so
## End(No test)



