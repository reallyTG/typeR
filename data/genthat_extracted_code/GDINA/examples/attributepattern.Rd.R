library(GDINA)


### Name: attributepattern
### Title: Generate all possible attribute patterns
### Aliases: attributepattern

### ** Examples

attributepattern(3)

q <- matrix(scan(text = "0 1 2 1 0 1 1 2 0"),ncol = 3)
q
attributepattern(Q=q)

q <- matrix(scan(text = "0 1 1 1 0 1 1 1 0"),ncol = 3)
q
attributepattern(K=ncol(q),Q=q)



