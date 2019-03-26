library(sommer)


### Name: atcg1234
### Title: Letter to number converter
### Aliases: atcg1234

### ** Examples

data(DT_polyploid)
genotypes <- GT
genotypes[1:5,1:5] # look the original format

####=================================================####
#### convert markers to numeric format polyploid potatoes
####=================================================####
# numo <- atcg1234(data=genotypes, ploidy=4)
# numo$M[1:5,1:5]

####=================================================####
#### convert markers to numeric format diploid rice lines
#### single letter code for inbred lines from GBS pipeline
#### A=AA, T=TT, C=CC, G=GG 
####=================================================####
# data(DT_rice)
# X <- GT; X[1:5,1:5]; dim(X)
# numo2 <- atcg1234(data=X, ploidy=2)
# numo2$M[1:5,1:5]



