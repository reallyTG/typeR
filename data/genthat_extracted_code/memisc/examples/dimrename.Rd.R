library(memisc)


### Name: dimrename
### Title: Change dimnames, rownames, or colnames
### Aliases: dimrename colrename rowrename
### Keywords: manip

### ** Examples

m <- matrix(1,2,2)
rownames(m) <- letters[1:2]
colnames(m) <- LETTERS[1:2]
m
dimrename(m,1,a="first",b="second")
dimrename(m,1,A="first",B="second")
dimrename(m,2,"A"="first",B="second")

rowrename(m,a="first",b="second")
colrename(m,"A"="first",B="second")



