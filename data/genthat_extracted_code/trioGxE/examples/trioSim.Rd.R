library(trioGxE)


### Name: trioSim
### Title: Simulate informative case-parent trios
### Aliases: trioSim
### Keywords: datagen

### ** Examples

# Generate case-parent trio from a population composed of 
# two equal sized subpopulations.

# Set up list of functions to sample from each E distribution

e1<-function(n) {
return(rnorm(n,mean=(-0.8),sd=sqrt(1-.8^2)))
}
e2<-function(n) {
return(rnorm(n,mean=(0.8),sd=sqrt(1-.8^2)))
}

# Set up haplotype frequency distributions in the two subpopulations: 
# The first subpopulation has the risk allele frequency of 0.1, where as
# the second subpopulation's frequency is 0.9. 

# Set up risk model function.
## Simulate informative case-parent trios under additive linear GxE with a negative slope

riskmod<-function(G,E) {
n<-length(G)
# Baseline risk. Affects disease prevalence.
# The higher the prevalence, the less time wasted
# rejecting unaffected trios.
k<-(-2) 

betaG<-log(3)/2

# Interaction
betaGE<-(-0.1)

# quadratic GxE
rr<-exp(k+betaG*G + betaGE*G*E)
rr[rr>1]<-1 # It is up to the user to make sure there are
# no probabilities greater than one.

D<-rbinom(n=n,size=1,prob=rr)
return(D)
}


# Simulate trio data under haplotype-environment dependence 
# when marker locus is causal locus.
# allele frequency in subpop 0 is 0.1, allele frequency in subpop 1 is 0.9.
hapf1=c(0.9, 0, 0, 0.1)
hapf2=c(0.1, 0, 0, 0.9)
simdat.HEdep<-trioSim(n=3000,popfs=c(0.5,0.5),riskmod=riskmod,
                      edists=list(e1,e2),hapfs=list(hapf1,hapf2), 
                      recomb=0,batchsize=1000)

# Simulate trio data under haplotype-environment independence
# when marker locus is causal locus.
# allele frequency in subpop 0 and subpop 1 is 0.1.
hapf1=hapf2=c(0.9, 0, 0, 0.1)
simdat.HEindep<-trioSim(n=3000,popfs=c(0.5,0.5),riskmod=riskmod,
                        edists=list(e1,e2),hapfs=list(hapf1,hapf2), 
                        recomb=0,batchsize=1000)




