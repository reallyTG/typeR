library(OGI)


### Name: cov2weight
### Title: Weight Vectors of the Bi-unit Canonical Form
### Aliases: cov2weight

### ** Examples

S = matrix(0, 5, 5)
S[1,1] = 1
for(j in 2:5) S[1,j] = S[j,1] = -0.5
for(i in 2:5){
  for(j in 2:5){
    if(i == j) S[i,j] = 1
    else S[i,j] = 0.5
  }
}
weight=cov2weight(S)
weight



