library(quokar)


### Name: frame_bayes
### Title: Mean probability of posterior distribution and Kullback-Leibler
###   divergence for observations in Bayesian quantile regression model
### Aliases: frame_bayes

### ** Examples

## Not run: 
##D library(ggplot2)
##D ais_female <- subset(ais, Sex == 1)
##D y <- ais_female$BMI
##D x <- matrix(ais_female$LBM, 1)
##D tau <- c(0.1, 0.5, 0.9)
##D case <- rep(1:length(y), length(tau))
##D prob <- frame_bayes(y, x, tau, M =  5000, burn = 1000,
##D                  method = 'bayes.prob')
##D prob_m <- cbind(case, prob)
##D ggplot(prob_m, aes(x = case, y = value )) +
##D   geom_point() +
##D   geom_text(aes(label = case)) +
##D   facet_wrap(~variable, scale = 'free') +
##D   xlab("case number") +
##D   ylab("Mean probability of posterior distribution")
##D It takes time to run the following code.
##D kl <- frame_bayes(y, x, tau, M = 50, burn = 10,
##D                 method = 'bayes.kl')
##D kl_m <- cbind(case, kl)
##D ggplot(kl_m, aes(x = case, y = value)) +
##D   geom_point() +
##D   geom_text(aes(label = case)) +
##D   facet_wrap(~variable, scale = 'free')+
##D   xlab('case number') +
##D   ylab('Kullback-Leibler')
## End(Not run)




