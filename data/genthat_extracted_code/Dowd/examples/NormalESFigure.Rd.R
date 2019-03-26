library(Dowd)


### Name: NormalESFigure
### Title: Figure of normal VaR and ES and pdf against L/P
### Aliases: NormalESFigure

### ** Examples

# Plots lognormal VaR, ES and pdf against L/P data for given returns data
   data <- runif(5, min = 0, max = .2)
   NormalESFigure(returns = data, cl = .95, hp = 90)

   # Plots lognormal VaR, ES and pdf against L/P data with given parameters
   NormalESFigure(mu = .012, sigma = .03, cl = .95, hp = 90)



