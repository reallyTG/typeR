library(shadowtext)


### Name: geom_shadowtext
### Title: geom_shadowtext
### Aliases: geom_shadowtext

### ** Examples

library(ggplot2)
d <- data.frame(x = rnorm(3), y=rnorm(3), label = c('hello', 'world', '!!!'))
ggplot(d, aes(x,y)) + geom_shadowtext(aes(label=label, color=label), bg.colour='firebrick')



