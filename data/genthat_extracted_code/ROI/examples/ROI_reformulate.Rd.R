library(ROI)


### Name: ROI_reformulate
### Title: Reformulate a Optimization Problem
### Aliases: ROI_reformulate

### ** Examples

## Example from 
## Boros, Endre, and Peter L. Hammer. "Pseudo-boolean optimization."
## Discrete applied mathematics 123, no. 1 (2002): 155-225.

## minimize: 3 x y + y z - x - 4 y - z + 6

Q <- rbind(c(0, 3, 0), 
           c(3, 0, 1), 
           c(0, 1, 0))
L <- c(-1, -4, -1)
x <- OP(objective = Q_objective(Q = Q, L = L), types = rep("B", 3))

## reformulate into a mixed integer linear problem
milp <- ROI_reformulate(x, "lp")

## reformulate into a second-order cone problem
socp <- ROI_reformulate(x, "socp")




