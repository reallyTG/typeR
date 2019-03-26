library(Biodem)


### Name: Fst
### Title: Calculates the Fst from the conditional kinship matrix
### Aliases: Fst
### Keywords: array manip misc

### ** Examples

# Swedlund data again...
data(P); data(S); data(N)
# starting with how many cycles to equilibrium
x<-mal.eq(S,P,N)
# calculation of phi
phi<-mal.phi(S,P,N,x)
# calculation of the conditional kinship matrix
cond<-mal.cond(phi,N)
# finally! we get the Fst value
fst<-Fst(cond,N)
fst

# starting from a raw marriage records dataset:
data(valley)
tot <- sur.freq(valley,valley$PAR,valley$SURM,valley$SURF)
tot # a frequency table calculated above all the surnames
iso.matrix <- uri(tot)
iso.matrix # an unbiased random isonymy matrix
reg <- rri(tot)
reg # a coefficient of unbiased Regional Random Isonymy
kin.cond <- rel.cond(iso.matrix,reg)
kin.cond # a conditional kinship matrix
N <- colSums(tot) # effective population size
fst<-Fst(kin.cond,N)
fst



