library(PK)


### Name: ci
### Title: Function to extract confidence interval(s)
### Aliases: ci
### Keywords: manip

### ** Examples

# Example from Nedelman et al. (1995)
conc <- c(2790, 3280, 4980, 7550, 5500, 6650, 2250, 3220, 213, 636)
time <- c(1, 1, 2, 2, 4, 4, 8, 8, 24, 24)

obj <- auc(conc=conc, time=time, method=c("z", "t"), design="ssd")

## all requested ci's
ci(obj)

## a specific ci
ci(obj, method="t")



