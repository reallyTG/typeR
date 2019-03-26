library(lsbclust)


### Name: step.lsbclust
### Title: Model Search for lsbclust
### Aliases: step.lsbclust

### ** Examples

m <- step.lsbclust(data = dcars, margin = 3, delta = c(1, 0, 1, 0), nclust = 4:5, 
                     ndim = 2, fixed = "columns", nstart = 1, nstart.kmeans = 100, 
                     parallel = FALSE)
                     
## For a list of all deltas                     
delta <- expand.grid(replicate(4, c(0,1), simplify = FALSE))
delta <- with(delta, delta[!(Var1 == 0 & Var3 == 1), ])
delta <- with(delta, delta[!(Var2 == 0 & Var4 == 1),])
delta <- delta[-4,]
delta <- as.list(as.data.frame(t(delta)))
m2 <- step.lsbclust(data = dcars, margin = 3, delta = delta, nclust = 4:5, 
                     ndim = 2, fixed = "columns", nstart = 1, nstart.kmeans = 100, 
                     parallel = FALSE)



