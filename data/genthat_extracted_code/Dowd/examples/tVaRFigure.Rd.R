library(Dowd)


### Name: tVaRFigure
### Title: Figure of t- VaR and pdf against L/P
### Aliases: tVaRFigure

### ** Examples

# Plots normal VaR and pdf against L/P data for given returns data
   data <- runif(5, min = 0, max = .2)
   tVaRFigure(returns = data, df = 7, cl = .95, hp = 90)

   # Plots normal VaR and pdf against L/P data with given parameters
   tVaRFigure(mu = .012, sigma = .03, df=7, cl = .95, hp = 90)



