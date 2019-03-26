library(MoEClust)


### Name: aitken
### Title: Aitken Acceleration
### Aliases: aitken
### Keywords: control

### ** Examples

(a1 <- aitken(-c(449.61534, 442.84221, 436.58999)))
a2  <- aitken(-c(442.84221, 436.58999, 436.58998))
abs(a2$linf - a1$linf) < 1e-05 #FALSE
a3  <- aitken(-c(436.58998, 436.58997, 436.58997))
abs(a3$linf - a2$linf) < 1e-05 #TRUE
(ll <- a3$linf)
(a  <- a3$a)



