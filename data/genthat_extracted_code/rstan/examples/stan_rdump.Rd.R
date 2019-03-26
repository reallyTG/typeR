library(rstan)


### Name: stan_rdump
### Title: Dump the data for a Stan model to R dump file in the limited
###   format that Stan can read.
### Aliases: stan_rdump
### Keywords: rstan

### ** Examples

# set variables in global environment
a <- 17.5
b <- c(1,2,3)
# write variables a and b to file ab.data.R in working directory
stan_rdump(c('a','b'), "ab.data.R")

x <- 1; y <- 1:10; z <- array(1:10, dim = c(2,5)) 
stan_rdump(ls(pattern = '^[xyz]'), "xyz.Rdump")
cat(paste(readLines("xyz.Rdump"), collapse = '\n'), '\n')
unlink("xyz.Rdump")



