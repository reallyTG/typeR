library(multilevel)


### Name: mix.data
### Title: Randomly mix grouped data
### Aliases: mix.data
### Keywords: programming

### ** Examples

data(bh1996)
mix.data(x=bh1996[c(1:10,200:210,300:310),2:3],
         grpid=bh1996$GRP[c(1:10,200:210,300:310)])



