library(languageR)


### Name: havelaar
### Title: The determiner 'het' in the Dutch novel Max Havelaar
### Aliases: havelaar
### Keywords: datasets

### ** Examples
## Not run: 
##D data(havelaar)
##D 
##D n = 1000                          # token size of text fragments
##D p = mean(havelaar$Frequency / n)  # relative frequencies
##D 
##D plot(qbinom(ppoints(99), n, p), sort(havelaar$Frequency),
##D    xlab = paste("quantiles of (", n, ",", round(p, 4), 
##D    ")-binomial", sep=""), ylab = "frequencies")
##D 
##D 
##D lambda = mean(havelaar$Frequency)
##D ks.test(havelaar$Frequency, "ppois", lambda)
##D ks.test(jitter(havelaar$Frequency), "ppois", lambda)
##D 
##D 
## End(Not run)


