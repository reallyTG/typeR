library(DGM)


### Name: binom.nettest
### Title: Performes a binomial test with FDR correction for network edge
###   occurrence.
### Aliases: binom.nettest

### ** Examples

# Generate some sample binary 5-node network structures for N=20, then perform
# significance testing.
N=20
x = rmdiag(array(rbinom(n=5*5*N, size=1, prob=0.10), dim=c(5,5,N)))
x[1,2,2:N]=1; x[2,3,seq(1,N,2)]=1 # add some consitent edges
A = apply(x, c(1,2), mean)
l = binom.nettest(x)




