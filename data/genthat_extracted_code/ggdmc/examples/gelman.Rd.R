library(ggdmc)


### Name: gelman
### Title: Potential scale reduction factor
### Aliases: gelman hgelman

### ** Examples

## Not run: 
##D rhat1 <- hgelman(hsam); rhat1
##D rhat2 <- hgelman(hsam, end = 51); rhat2
##D rhat3 <- hgelman(hsam, confidence = .90); rhat3
##D rhat4 <- hgelman(hsam, transform = FALSE); rhat4
##D rhat5 <- hgelman(hsam, autoburnin = TRUE); rhat5
##D rhat6 <- hgelman(hsam, split = FALSE); rhat6
##D rhat7 <- hgelman(hsam, subchain = TRUE); rhat7
##D rhat8 <- hgelman(hsam, subchain = TRUE, nsubchain = 4);
##D rhat9 <- hgelman(hsam, subchain = TRUE, nsubchain = 4,
##D digits = 1, verbose = TRUE);
##D 
##D hat1 <- gelman(hsam[[1]], multivariate = FALSE); hat1
##D hat2 <- gelman(hsam[[1]], hyper = TRUE, verbose = TRUE); hat2
##D hat3 <- gelman(hsam, hyper = TRUE, verbose = TRUE); hat3
##D hat4 <- gelman(hsam, multivariate = TRUE, verbose = FALSE);
##D hat5 <- gelman(hsam, multivariate = FALSE, verbose = FALSE);
##D hat6 <- gelman(hsam, multivariate = FALSE, verbose = TRUE);
##D hat7 <- gelman(hsam, multivariate = T, verbose = TRUE);
## End(Not run)



