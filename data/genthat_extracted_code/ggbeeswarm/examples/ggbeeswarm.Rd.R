library(ggbeeswarm)


### Name: ggbeeswarm
### Title: ggbeeswarm extends ggplot2 with violin point/beeswarm plots
### Aliases: ggbeeswarm ggbeeswarm-package

### ** Examples


  ggplot2::ggplot(ggplot2::mpg,aes(class, hwy)) + geom_quasirandom()
  # Generate fake data
  distro <- data.frame(
    'variable'=rep(c('runif','rnorm'),each=100),
    'value'=c(runif(100, min=-3, max=3), rnorm(100))
  )
  ggplot2::ggplot(distro,aes(variable, value)) + geom_quasirandom()
  ggplot2::ggplot(distro,aes(variable, value)) + geom_quasirandom(width=.1)




