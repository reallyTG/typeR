library(dna)


### Name: cornet
### Title: Correlation network
### Aliases: cornet

### ** Examples

# small example using cornet without rescaled scores
X1=rbind(
c(2.5,6.7,4.5,2.3,8.4,3.1),
c(1.2,0.7,4.0,9.1,6.6,7.1),
c(4.3,-1.2,7.5,3.8,1.0,9.3),
c(9.5,7.6,5.4,2.3,1.1,0.2))
s=cornet(X1)
print(round(s,4))

# small example using cornet with rescaled scores
s2=cornet(X1,rescale.scores=TRUE)
print(round(s2,4))



