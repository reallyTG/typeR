library(surveyplanning)


### Name: MoE_P
### Title: Margin of error for proportion
### Aliases: MoE_P
### Keywords: surveyplanning

### ** Examples


n <- 100
pop <- 1000

MoE_P(P = 0.5, n = n, pop = pop)

DT <- data.table(P = seq(0, 1, 0.01))
DT[, Y := round(pop * P)]
DT[, AMoE := MoE_P(P, n = 100, pop = 1000)]
DT[Y > 0, RMoE := AMoE / Y]
DT




