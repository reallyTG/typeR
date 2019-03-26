library(Dowd)


### Name: tESFigure
### Title: Figure of t - VaR and ES and pdf against L/P
### Aliases: tESFigure

### ** Examples

# Plots lognormal VaR, ES and pdf against L/P data for given returns data
   data <- runif(5, min = 0, max = .2)
   tESFigure(returns = data, df = 10, cl = .95, hp = 90)

   # Plots lognormal VaR, ES and pdf against L/P data with given parameters
   tESFigure(mu = .012, sigma = .03, df = 10, cl = .95, hp = 90)



