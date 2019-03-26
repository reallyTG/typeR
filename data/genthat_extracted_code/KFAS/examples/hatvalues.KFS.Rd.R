library(KFAS)


### Name: hatvalues.KFS
### Title: Extract Hat Values from KFS Output
### Aliases: hatvalues.KFS

### ** Examples

model <- SSModel(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)
out <- KFS(model, filtering = "state", smoothing = "none")
# estimate sigma2
model["H"] <- mean(c(out$v[1:out$d][out$Finf==0]^2/out$F[1:out$d][out$Finf==0],
                     out$v[-(1:out$d)]^2/out$F[-(1:out$d)]))
c(hatvalues(KFS(model)))




