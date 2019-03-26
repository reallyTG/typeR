library(quokar)


### Name: bayesProb
### Title: Mean posterior probability for each observation in Baysian
###   quantile regression model
### Aliases: bayesProb

### ** Examples

## Not run: 
##D ais_female <- subset(ais, Sex == 1)
##D y <- ais_female$BMI
##D x <- cbind(1, ais_female$LBM)
##D tau <- 0.5
##D M <- 5000
##D burn <- 1000
##D prob <- bayesProb(y, x, tau, M, burn)
##D case <-  1:100
##D dat <- data.frame(case, prob)
##D ggplot(dat, aes(case, prob))+
##D  geom_point() +
##D  geom_text(data = subset(dat, prob > mean(prob) + 2*sd(prob)),
## End(Not run)






