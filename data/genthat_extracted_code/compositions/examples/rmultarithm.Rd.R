library(compositions)


### Name: rmultarithm
### Title: vectorial arithmetic for datasets in a classical vector scale
### Aliases: +.rmult -.rmult *.rmult /.rmult
### Keywords: multivariate

### ** Examples

x <- rmult(matrix( sqrt(1:12), ncol= 3 ))
x
x+x
x + rmult(1:3)
x * 1:4
1:4 * x
x / 1:4
x / 10



