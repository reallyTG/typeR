library(VGAM)


### Name: Oazeta
### Title: One-Altered Logarithmic Distribution
### Aliases: Oazeta doazeta poazeta qoazeta roazeta
### Keywords: distribution

### ** Examples

shape <- 1.1; pobs1 <- 0.10; x <- (-1):7
doazeta(x, shape = shape, pobs1 = pobs1)
table(roazeta(100, shape = shape, pobs1 = pobs1))

## Not run: 
##D  x <- 0:10
##D barplot(rbind(doazeta(x, shape = shape, pobs1 = pobs1),
##D                 dzeta(x, shape = shape)),
##D         beside = TRUE, col = c("blue", "orange"), cex.main = 0.7, las = 1,
##D         ylab = "Probability", names.arg = as.character(x),
##D         main = paste("OAZ(shape = ", shape, ", pobs1 = ", pobs1,
##D                    ") [blue] vs",  " zeta(shape = ", shape,
##D                    ") [orange] densities", sep = "")) 
## End(Not run)



