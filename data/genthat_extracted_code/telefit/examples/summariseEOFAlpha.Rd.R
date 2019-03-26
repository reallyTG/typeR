library(telefit)


### Name: summariseEOFAlpha
### Title: Summarize eof-mapped alphas
### Aliases: summariseEOFAlpha

### ** Examples


data("coprecip.predict")
attach(coprecip.predict)

alpha.eof.90 = summariseEOFAlpha(eof_alpha = eof_alpha_knots, prob = .9, 
  coords.s = coords.s)




