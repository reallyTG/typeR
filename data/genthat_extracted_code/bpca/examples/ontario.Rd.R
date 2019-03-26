library(bpca)


### Name: ontario
### Title: Ontario winter wheat (1993)
### Aliases: ontario
### Keywords: datasets

### ** Examples

data(ontario)

# 2d
plot(bpca(ontario,
          d=1:2))

# 3d
plot(bpca(ontario,
          d=1:3),
     rgl.use=TRUE)



