library(biomod2)


### Name: Find.Optim.Stat
### Title: Calculate the best score according to a given evaluation method
### Aliases: Find.Optim.Stat
### Keywords: evaluate, evaluation models, options,

### ** Examples

  a <- sample(c(0,1),100, replace=TRUE)
                
  ##' random drawing
  b <- runif(100,min=0,max=1000)
  Find.Optim.Stat(Stat='TSS',
                  Fit=b,
                  Obs=a)
                
  ##' biased drawing
  BiasedDrawing <- function(x, m1=300, sd1=200, m2=700, sd2=200){
    return(ifelse(x<0.5, rnorm(1,m1,sd1), rnorm(1,m2,sd2)))
  }
                
  c <- sapply(a,BiasedDrawing)
                
  Find.Optim.Stat(Stat='TSS',
                  Fit=c,
                  Obs=a,
                  Nb.thresh.test = 100)  
                
                



