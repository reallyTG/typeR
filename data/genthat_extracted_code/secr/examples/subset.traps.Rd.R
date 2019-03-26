library(secr)


### Name: subset.traps
### Title: Subset traps Object
### Aliases: subset.traps split.traps
### Keywords: manip

### ** Examples

## odd-numbered traps only, using modulo operator
temptrap <- make.grid(nx = 7, ny = 7)
t2 <- subset(temptrap, as.logical(1:nrow(temptrap) %% 2))
plot(t2)

## this works also for even number of rows, but must change 'outer' call
temptrap <- make.grid(nx = 8, ny = 8)
t3 <- subset(temptrap, !as.logical(outer(1:8,1:8,'+')%%2))
plot(t3)



