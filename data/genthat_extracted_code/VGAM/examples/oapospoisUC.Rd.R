library(VGAM)


### Name: Oapospois
### Title: One-Altered Logarithmic Distribution
### Aliases: Oapospois doapospois poapospois qoapospois roapospois
### Keywords: distribution

### ** Examples

lambda <- 3; pobs1 <- 0.30; x <- (-1):7
doapospois(x, lambda = lambda, pobs1 = pobs1)
table(roapospois(100, lambda = lambda, pobs1 = pobs1))

## Not run: 
##D  x <- 0:10
##D barplot(rbind(doapospois(x, lambda = lambda, pobs1 = pobs1),
##D                 dpospois(x, lambda = lambda)),
##D         beside = TRUE, col = c("blue", "orange"), cex.main = 0.7, las = 1,
##D         ylab = "Probability", names.arg = as.character(x),
##D         main = paste("OAPP(lambda = ", lambda, ", pobs1 = ", pobs1,
##D                    ") [blue] vs",  " PosPoisson(lambda = ", lambda,
##D                    ") [orange] densities", sep = "")) 
## End(Not run)



