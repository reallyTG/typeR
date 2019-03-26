library(GUILDS)


### Name: preston_plot
### Title: Barplot in Preston style of an abundance dataset
### Aliases: preston_plot

### ** Examples

  theta = 10
  m = 0.1
  J = 1000
  I = m * (J - 1) / (1 - m)
  
  abund <- generate.ESF(theta, I, J)
  par(mfrow = c(1,2))
  preston_plot(abund)
  abund.expect <- expected.SAD(theta, m, J)
  preston_plot(abund, abund.expect)



