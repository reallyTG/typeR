library(picante)


### Name: pblm
### Title: Phylogenetic Bipartite Linear Model
### Aliases: pblm pblmpredict
### Keywords: univar

### ** Examples

## No test: 
#load example data from Ives & Godfray (2006)
data(IvesGodfray)

#net attack rate of parasitoid on host eq.4 in Ives and Godfray
A<-(-1*log(1-IvesGodfray$interactions[,-28]/t(IvesGodfray$interactions[28])))

# Make tips of the phylogenetic trees contemporaneous by extending tips
p<-dim(IvesGodfray$host)[1]
q<-dim(IvesGodfray$parasitoid)[1]
host.cov.scaled<-IvesGodfray$host
para.cov.scaled<-IvesGodfray$parasitoid
for (i in 1:p)
{
  host.cov.scaled[i,i]<-max(host.cov.scaled)
}
for (i in 1:q)
{
  para.cov.scaled[i,i]<-max(para.cov.scaled)
}

# scale covariance matrices (this reduces numerical problems caused by
# determinants going to infinity or zero)
  host.cov.scaled<-host.cov.scaled/(det(as.matrix(host.cov.scaled))^(1/p))
  para.cov.scaled<-para.cov.scaled/(det(as.matrix(para.cov.scaled))^(1/q))

pblm.A <- pblm(sqrt(A),tree1=host.cov.scaled,tree2=para.cov.scaled)
pblm.A$signal.strength    #compare to Ives and Godfray (2006) Table 1 Line 1
pblm.A$MSE
## End(No test)



