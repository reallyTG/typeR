library(Dowd)


### Name: LogNormalESFigure
### Title: Figure of lognormal VaR and ES and pdf against L/P
### Aliases: LogNormalESFigure

### ** Examples

# Plots lognormal VaR, ES and pdf against L/P data for given returns data
   data <- runif(5, min = 0, max = .2)
   LogNormalESFigure(returns = data, investment = 5, cl = .95, hp = 90)

   # Plots lognormal VaR, ES and pdf against L/P data with given parameters
   LogNormalESFigure(mu = .012, sigma = .03, investment = 5, cl = .95, hp = 90)



