library(liureg)


### Name: hatl.liu
### Title: Liu Regression: Hat Matrix
### Aliases: hatl hatl.liu
### Keywords: Liu regression Liu hat matrix

### ** Examples

mod<-liu(y ~ . , data = as.data.frame(Hald), d = c(-5, -1, 0.2, 0.3))
## Hat matrix for each biasing parameter
hatl(mod)

## Hat matrix for second biasing parameter i.e. d = -1
hatl(mod)[[2]]

## Diagonal element of hat matrix for second biasing parameter
diag(hatl(mod)[[2]])



