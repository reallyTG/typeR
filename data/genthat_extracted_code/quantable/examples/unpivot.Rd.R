library(quantable)


### Name: unpivot
### Title: unpivot data matrix
### Aliases: unpivot

### ** Examples

x = matrix(1:25,ncol=5)
x = as.data.frame(x)
colnames(x) = letters[1:5]
rownames(x) = LETTERS[1:5]
unpivot(x)



