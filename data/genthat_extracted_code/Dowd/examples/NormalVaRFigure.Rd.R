library(Dowd)


### Name: NormalVaRFigure
### Title: Figure of normal VaR and pdf against L/P
### Aliases: NormalVaRFigure

### ** Examples

# Plots normal VaR and pdf against L/P data for given returns data
   data <- runif(5, min = 0, max = .2)
   NormalVaRFigure(returns = data, cl = .95, hp = 90)

   # Plots normal VaR and pdf against L/P data with given parameters
   NormalVaRFigure(mu = .012, sigma = .03, cl = .95, hp = 90)



