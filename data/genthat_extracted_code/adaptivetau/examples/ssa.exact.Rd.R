library(adaptivetau)


### Name: ssa.exact
### Title: Exact stochastic simulation algorithm
### Aliases: ssa.exact
### Keywords: datagen

### ** Examples

## Lotka-Volterra example
lvrates <- function(x, params, t) {
  with(params, {
    return(c(preygrowth*x["prey"],      ## prey growth rate
             x["prey"]*x["pred"]*eat,   ## prey death / predator growth rate
             x["pred"]*preddeath))      ## predator death rate
  })
}
params=list(preygrowth=10, eat=0.01, preddeath=10);
r=ssa.exact(c(prey = 1000, pred = 500),
            matrix(c(1,0, -2,1, 0,-1), nrow=2), lvrates, params, tf=2)
matplot(r[,"time"], r[,c("prey","pred")], type='l', xlab='Time', ylab='Counts')
legend("topleft", legend=c("prey", "predator"), lty=1:2, col=1:2)



