library(TreeSim)


### Name: sim.gsa.taxa
### Title: sim.gsa.taxa: Sampling trees on n tips from bigger trees.
### Aliases: sim.gsa.taxa

### ** Examples

##
# First 100 trees on 9 tips under a birth-death process are generated.
# Then trees on 5 species are sampled from these 100 trees using the GSA
# (see references). 
# You can easily simulate trees on m species with the simple sampling
# approach (see references) under a variety of models. Then use the
# provided GSA algorithm to get a correct sample of trees on n<<m species:

m<-9
n<-5
numbsim<-100
lambda <- 2.0
mu <- 0.5

t<-sim.bd.taxa(m,numbsim,lambda,mu)
t2<-sim.gsa.taxa(t,n)



