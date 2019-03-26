library(VGAM)


### Name: Oalog
### Title: One-Altered Logarithmic Distribution
### Aliases: Oalog doalog poalog qoalog roalog
### Keywords: distribution

### ** Examples

shape <- 0.75; pobs1 <- 0.10; x <- (-1):7
doalog(x, shape = shape, pobs1 = pobs1)
table(roalog(100, shape = shape, pobs1 = pobs1))

## Not run: 
##D  x <- 0:10
##D barplot(rbind(doalog(x, shape = shape, pobs1 = pobs1),
##D                 dlog(x, shape = shape)),
##D         beside = TRUE, col = c("blue", "orange"), cex.main = 0.7, las = 1,
##D         ylab = "Probability", names.arg = as.character(x),
##D         main = paste("OAL(shape = ", shape, ", pobs1 = ", pobs1,
##D                    ") [blue] vs",  " Logarithmic(shape = ", shape,
##D                    ") [orange] densities", sep = "")) 
## End(Not run)



