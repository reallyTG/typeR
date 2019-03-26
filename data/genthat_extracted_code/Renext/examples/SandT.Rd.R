library(Renext)


### Name: SandT
### Title: Compute empirical survivals (S) and return periods (T)
### Aliases: SandT

### ** Examples

## use an object with class "Rendata"
ST1 <- SandT(object = Garonne)
## basic return level plot
plot(ST1$T, ST1$x, col = ST1$group, log = "x")
## use an object with class "Renouv"
fit <- Renouv(x = Garonne, plot = FALSE)
ST2 <- SandT(object = fit)
plot(ST2$T, ST2$x, col = ST2$group, log = "x")



