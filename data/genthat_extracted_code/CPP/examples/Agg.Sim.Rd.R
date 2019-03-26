library(CPP)


### Name: Agg.Sim
### Title: Aggregation of expert's estimatives by similarity of values
### Aliases: Agg.Sim

### ** Examples

## Expert's estimatives on four criteria
Exp.1 = c(4,7,6,8)
Exp.2 = c(4,3,6,5)
Exp.3 = c(3,8,2,9)
Exp.4 = c(6,8,9,7)
Exp.5 = c(5,9,2,4)
Exp.6 = c(7,6,5,5)
x = rbind(Exp.1,Exp.2,Exp.3,Exp.4,Exp.5) # Decision matrix
min = c(0,0,0,0) # Minimum scale values.
max = c(10,10,10,10) # Maximum scale values.
s = 4 # Shape
w = c(0.4,0.3,0.2,0.06,0.04) # Expert relevance.
b = 0.4
Agg.Sim(x,min,max,s,w,b)



