library(GMMBoost)


### Name: bGAMM
### Title: Fit Generalized Semiparametric Mixed-Effects Models
### Aliases: bGAMM
### Keywords: models methods

### ** Examples
  
data("soccer")

gamm1 <- bGAMM(points ~ ball.possession + tackles,
         ~ transfer.spendings + transfer.receits 
         + unfair.score + ave.attend + sold.out,
         rnd = list(team=~1), data = soccer, lambda = 1e+5,
         family = poisson(link = log), control = list(steps=200, overdispersion=TRUE,
         start=c(1,rep(0,25))))

plot(gamm1)

# see also demo("bGAMM-soccer")



