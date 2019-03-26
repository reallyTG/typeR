library(ROI)


### Name: maximum (Set/Get)
### Title: Maximum - Accessor and Mutator Functions
### Aliases: 'maximum (Set/Get)' maximum maximum<-

### ** Examples

## maximize: x + y
## subject to: x + y <= 2
## x, y >= 0
x <- OP(objective = c(1, 1), 
        constraints = L_constraint(L = c(1, 1), dir = "<=", rhs = 2),
        maximum = FALSE)
maximum(x) <- TRUE
maximum(x)



