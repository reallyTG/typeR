library(dna)


### Name: PLSnet
### Title: Partial Least Squares network
### Aliases: PLSnet

### ** Examples

# small example using PLSnet with 3 latent PLS components,
# data rescaled, and scores symmetrized but not rescaled
X1=rbind(
c(2.5,6.7,4.5,2.3,8.4,3.1),
c(1.2,0.7,4.0,9.1,6.6,7.1),
c(4.3,-1.2,7.5,3.8,1.0,9.3),
c(9.5,7.6,5.4,2.3,1.1,0.2))
s=PLSnet(X1)
print(round(s,4))

# small example using PLSnet with 2 latent PLS components,
# data rescaled, and scores symmetrized and rescaled
s2=PLSnet(X1,ncom=2,rescale.data=TRUE,symmetrize.scores=TRUE,rescale.scores=TRUE)
print(round(s2,4))



