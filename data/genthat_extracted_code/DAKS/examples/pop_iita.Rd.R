library(DAKS)


### Name: pop_iita
### Title: Population Inductive Item Tree Analysis
### Aliases: pop_iita
### Keywords: htest manip models univar

### ** Examples

x <- simu(3, 10000, ce = 0.05, lg = 0.05, delta = 0.12)
y <- iita(x$dataset, v = 2)
z <- pop_iita(x$implications, 0.05, 0.05, 3, x$dataset, v = 2)

## similar sample and population diff values are obtained
(y$diff) / (10000^2)
z



