library(doBy)


### Name: data-budworm
### Title: budworm data
### Aliases: data-budworm budworm
### Keywords: datasets

### ** Examples


data(budworm)

## function to caclulate the empirical logits
empirical.logit<- function(y, n) {
   el <- log((y + 0.5) / (n - y + 0.5))
   el
}


# plot the empirical logits against log-dose

log.dose <- log(budworm$dose)
emp.logit <- empirical.logit(budworm$ndead, budworm$ntotal)
plot(log.dose, emp.logit, type='n', xlab='log-dose', ylab='emprirical logit')
title('budworm: emprirical logits of probability to die ')
male <- budworm$sex=='male'
female <- budworm$sex=='female'
lines(log.dose[male], emp.logit[male], type='b', lty=1, col=1)
lines(log.dose[female], emp.logit[female], type='b', lty=2, col=2)
legend(0.5, 2, legend=c('male', 'female'), lty=c(1, 2), col=c(1, 2))

## Not run: 
##D * SAS example;
##D data budworm;
##D infile 'budworm.txt' firstobs=2;
##D input sex dose ndead ntotal;
##D run;
## End(Not run)





