library(Davies)


### Name: least.squares
### Title: Finds the optimal Davies distribution for a dataset
### Aliases: least.squares maximum.likelihood
### Keywords: distribution

### ** Examples

p <- c(10 , 0.1 , 0.1)
d <- rdavies(50,p)
system.time(print(maximum.likelihood(d)))
                           #observe how long this takes.
                           #The time is taken in repeated calls
                           #to pdavies(), which uses uniroot().

system.time(print(least.squares(d)))
                           #Much faster.



