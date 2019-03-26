library(CPP)


### Name: CPP.mb
### Title: CPP with multiple perspectives for decision-making, based on the
###   'Moneyball' principle.
### Aliases: CPP.mb

### ** Examples

## Decision matrix of the previous moment '1'.
Alt.1 = c(2,30,86,-5)
Alt.2 = c(4,26,77,-12)
Alt.3 = c(3,22,93,-4)
Alt.4 = c(6,34,65,-10)
Alt.5 = c(5,31,80,-8)
Alt.6 = c(6,29,79,-9)
Alt.7 = c(8,37,55,-15)
Alt.8 = c(10,21,69,-11)
t1 = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5,Alt.6,Alt.7,Alt.8)
## Decision matrix of the following moment '2'.
Alt.1 = c(3,29,82,-3)
Alt.2 = c(6,28,70,-8)
Alt.3 = c(2,20,99,-8)
Alt.4 = c(5,31,62,-14)
Alt.5 = c(9,27,73,-5)
Alt.6 = c(4,33,85,-13)
Alt.7 = c(9,39,59,-10)
Alt.8 = c(8,19,77,-9)
t2 = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5,Alt.6,Alt.7,Alt.8)
m = c(100,120,150,140,90,70,110,130) # Market values
q = c(0.65,0.35) # quantiles of class profiles
s = 4 # Shape
CPP.mb(t1,t2,m,q,s)



