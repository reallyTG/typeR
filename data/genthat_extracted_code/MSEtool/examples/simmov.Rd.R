library(MSEtool)


### Name: simmov
### Title: Calculates movement matrices from user inputs
### Aliases: simmov plot_mov

### ** Examples

## No test: 
movOM_5areas <- simmov(testOM, dist = c(0.01,0.1,0.2,0.3,0.39), prob = c(0.1,0.6,0.6,0.7,0.9))
movOM_5areas@cpars$mov[1, 1, , ] # sim 1, age 1, movement from areas in column i to areas in row j
plot_mov(movOM_5areas@cpars$mov)
plot_mov(movOM_5areas@cpars$mov, type = "all")
## End(No test)



