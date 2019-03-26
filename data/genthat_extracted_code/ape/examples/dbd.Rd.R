library(ape)


### Name: dbd
### Title: Probability Density Under Birth-Death Models
### Aliases: dyule dbd dbdTime
### Keywords: utilities

### ** Examples

x <- 0:10
plot(x, dyule(x), type = "h", main = "Density of the Yule process")
text(7, 0.85, expression(list(lambda == 0.1, t == 1)))

y <- dbd(x, 0.1, 0.05, 10)
z <- dbd(x, 0.1, 0.05, 10, conditional = TRUE)
d <- rbind(y, z)
colnames(d) <- x
barplot(d, beside = TRUE, ylab = "Density", xlab = "Number of species",
        legend = c("unconditional", "conditional on\nno extinction"),
        args.legend = list(bty = "n"))
title("Density of the birth-death process")
text(17, 0.4, expression(list(lambda == 0.1, mu == 0.05, t == 10)))

## Not run: 
##D ### generate 1000 values from a Yule process with lambda = 0.05
##D x <- replicate(1e3, Ntip(rlineage(0.05, 0)))
##D 
##D ### the correct way to calculate the log-likelihood...:
##D sum(dyule(x, 0.05, 50, log = TRUE))
##D 
##D ### ... and the wrong way:
##D log(prod(dyule(x, 0.05, 50)))
##D 
##D ### a third, less preferred, way:
##D sum(log(dyule(x, 0.05, 50)))
## End(Not run)


