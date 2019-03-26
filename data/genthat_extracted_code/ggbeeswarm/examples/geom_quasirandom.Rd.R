library(ggbeeswarm)


### Name: geom_quasirandom
### Title: Points, jittered to reduce overplotting using the vipor package
### Aliases: geom_quasirandom

### ** Examples

  ggplot2::qplot(class, hwy, data = ggplot2::mpg, geom='quasirandom')
  # Generate fake data
  distro <- data.frame(
    'variable'=rep(c('runif','rnorm'),each=100),
    'value'=c(runif(100, min=-3, max=3), rnorm(100))
  )
  ggplot2::qplot(variable, value, data = distro, geom = 'quasirandom')
  ggplot2::ggplot(distro,aes(variable, value)) + geom_quasirandom(width=0.1)



