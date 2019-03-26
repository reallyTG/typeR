library(strucchange)


### Name: boundary.efp
### Title: Boundary for Empirical Fluctuation Processes
### Aliases: boundary.efp
### Keywords: regression

### ** Examples

## Load dataset "nhtemp" with average yearly temperatures in New Haven
data("nhtemp")
## plot the data
plot(nhtemp)

## test the model null hypothesis that the average temperature remains constant
## over the years
## compute OLS-CUSUM fluctuation process
temp.cus <- efp(nhtemp ~ 1, type = "OLS-CUSUM")
## plot the process without boundaries
plot(temp.cus, alpha = 0.01, boundary = FALSE)
## add the boundaries in another colour
bound <- boundary(temp.cus, alpha = 0.01)
lines(bound, col=4)
lines(-bound, col=4)



