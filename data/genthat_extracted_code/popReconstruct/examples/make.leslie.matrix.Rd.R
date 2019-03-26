library(popReconstruct)


### Name: make.leslie.matrix
### Title: Make Leslie Matrix
### Aliases: make.leslie.matrix

### ** Examples

example(popRecon.ccmp.female)

(Lk <- make.leslie.matrix(pop = pop.input.mat[,1]
                       ,surv = burkina.faso.females$survival.proportions[,1]
                       ,fert = burkina.faso.females$fertility.rates[,1]
                       ,srb = 1.05
                       ,age.int = 5))



