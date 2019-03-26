library(matchingMarkets)


### Name: klein15b
### Title: Results of Monte Carlo Simulations in Klein (2015b)
### Aliases: klein15b
### Keywords: datasets

### ** Examples

## Plot of posterior distributions

data(klein15b)

tpe <- c(rep("Benchmark",2), rep("Experiment 1",2), rep("Experiment 2",2))

for(i in seq(1,length(klein15b)-1,2)){
  ntu <- klein15b[[i]]
  ols <- klein15b[[i+1]]

  ntu <- ntu[,colnames(ntu) == "beta.wst.ieq"]
  ols <- ols[,colnames(ols) == "beta.wst.ieq"]
  
  if(i == 1){
    draws <- data.frame(Structural=ntu, OLS=ols, type=tpe[i]) #, stringsAsFactors=FALSE
  } else{
    draws <- rbind(draws, data.frame(Structural=ntu, OLS=ols, type=tpe[i]))
  }
}

library(lattice)
lattice.options(default.theme = standard.theme(color = FALSE))
keys <- list(text=c("Structural model","OLS"), space="top", columns=2, lines=TRUE)
densityplot( ~ Structural + OLS | type, plot.points=FALSE, auto.key=keys,
       data = draws, xlab = "coefficient draws", ylab = "density", type = "l",
       panel = function(x,...) {
         panel.densityplot(x,...)
         panel.abline(v=-1, lty=3)
       })

## Not run: 
##D ## Modes of posterior distributions
##D 
##D ## load data
##D data(klein15b)
##D 
##D ## define function to obtain the mode
##D mode <- function(x){
##D   d <- density(x,bw="SJ")
##D   formatC(round(d$x[which.max(d$y)], 3), format='f', digits=3)
##D }
##D 
##D ## Benchmark study
##D apply(klein15b$exp.5.5.ntu, 2, mode)
##D apply(klein15b$exp.5.5.ols, 2, mode)
##D 
##D ## Experiment 1
##D apply(klein15b$exp.6.5.ntu, 2, mode)
##D apply(klein15b$exp.6.5.ols, 2, mode)
##D 
##D ## Experiment 2
##D apply(klein15b$exp.6.6.ntu, 2, mode)
##D apply(klein15b$exp.6.6.ols, 2, mode)
## End(Not run)



