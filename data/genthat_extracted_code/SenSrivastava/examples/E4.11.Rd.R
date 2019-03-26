library(SenSrivastava)


### Name: E4.11
### Title: Data on Cost of Repairing Starters, Ring Gears or Both in Diesel
###   Engines
### Aliases: E4.11
### Keywords: datasets

### ** Examples

data(E4.11)
E4.11.m1 <- lm(Cost ~ Part - 1, data=E4.11)
summary(E4.11.m1)



