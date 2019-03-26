library(mcMST)


### Name: prueferToCharVec
### Title: Convert Pruefer code to characteristic vector.
### Aliases: prueferToCharVec

### ** Examples

# here we generate a random Pruefer-code representing
# a random spanning tree of a graph with n = 10 nodes
pcode = sample(1:10, 8, replace = TRUE)
print(pcode)
print(prueferToCharVec(pcode))



