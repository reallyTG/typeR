library(gllm)


### Name: scatter
### Title: Create a filter matrix from a summary array of indices
### Aliases: scatter
### Keywords: manip

### ** Examples

y<-double(3)
z<-1:5
z %*% scatter(y,c(1,1,2,3,3))
## 1+2, 3, 4+5



