library(hhi)


### Name: hhi
### Title: Calculates the Herfindahl-Hirschman Index
### Aliases: hhi

### ** Examples

a <- c(1,2,3,4) # arbitrary firm id
b <- c(20,30,40,10) # market share of each firm (should total 100% of market share)
x <- data.frame(a,b) # create data frame
hhi(x, "b") # calculate market concentration based on firms' share sizes



