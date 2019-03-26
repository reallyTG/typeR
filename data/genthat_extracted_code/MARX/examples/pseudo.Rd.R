library(MARX)


### Name: pseudo
### Title: The pseudo-causal model function
### Aliases: pseudo pseudo.default print.pseudo summary.pseudo
###   pseudo.default print.pseudo summary.pseudo
### Keywords: estimation pseudo-causal

### ** Examples

data <- sim.marx(c('t',1,1), c('t',1,1),100,0.5,0.4,0.3)
object <- pseudo(data$y, data$x, 2)
class(object) <- "pseudo"
summary(object)



