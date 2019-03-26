library(DJL)


### Name: ma.aps.reg
### Title: Combinatorial search (all possible subset) for regression
###   analysis
### Aliases: ma.aps.reg

### ** Examples

# Load airplane dataset
df <- dataset.airplane.2017

# ready
dv <- subset(df, select = 2)
iv <- subset(df, select = 3 : 7)

# go
ma.aps.reg(dv, iv, 1, 3, mad = TRUE, coeff.cor = TRUE)



