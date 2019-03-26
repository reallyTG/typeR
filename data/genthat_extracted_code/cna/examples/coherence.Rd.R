library(cna)


### Name: coherence
### Title: Calculate the coherence of complex solution formulas
### Aliases: coherence

### ** Examples

# Perfect coherence.
dat1 <- allCombs(rep(2, 6))-1 
dat2 <- selectCases("(A*b <-> C)*(C+D <-> E)", dat1)
coherence("(A*b <-> C)*(C + D <-> E)", dat2)
csf(cna(dat2, details = "c"))

# Non-perfect coherence.
dat3 <- allCombs(rep(2, 8)) -1
dat4 <- selectCases("(a*B <-> C)*(C + D<->E)*(F*g <-> H)", dat3)
dat5 <- rbind(tt2df(dat4), c(0,1,0,1,1,1,0,1))
coherence("(a*B <-> C)*(C + D <-> E)*(F*g <-> H)", dat5)
csf(cna(dat5, con=.88, details = "c")) 



