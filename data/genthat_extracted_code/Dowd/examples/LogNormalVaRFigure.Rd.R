library(Dowd)


### Name: LogNormalVaRFigure
### Title: Figure of lognormal VaR and pdf against L/P
### Aliases: LogNormalVaRFigure

### ** Examples

# Plots lognormal VaR and pdf against L/P data for given returns data
   data <- runif(5, min = 0, max = .2)
   LogNormalVaRFigure(returns = data, investment = 5, cl = .95, hp = 90)

   # Plots lognormal VaR and pdf against L/P data with given parameters
   LogNormalVaRFigure(mu = .012, sigma = .03, investment = 5, cl = .95, hp = 90)



