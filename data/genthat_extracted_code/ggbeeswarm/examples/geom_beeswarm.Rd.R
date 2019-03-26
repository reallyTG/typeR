library(ggbeeswarm)


### Name: geom_beeswarm
### Title: Points, jittered to reduce overplotting using the beeswarm
###   package
### Aliases: geom_beeswarm

### ** Examples


  ggplot2::qplot(class, hwy, data = ggplot2::mpg, geom='beeswarm')
  # Generate fake data
  distro <- data.frame(
    'variable'=rep(c('runif','rnorm'),each=100),
    'value'=c(runif(100, min=-3, max=3), rnorm(100))
  )
  ggplot2::qplot(variable, value, data = distro, geom='beeswarm')
  ggplot2::ggplot(distro,aes(variable, value)) +
    geom_beeswarm(priority='density',cex=2.5)



