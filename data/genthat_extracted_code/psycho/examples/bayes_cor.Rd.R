library(psycho)


### Name: bayes_cor
### Title: Bayesian Correlation Matrix.
### Aliases: bayes_cor

### ** Examples

## Not run: 
##D library(psycho)
##D 
##D df <- psycho::affective
##D cor <- bayes_cor(df)
##D summary(cor)
##D print(cor)
##D plot(cor)
##D 
##D df <- select(psycho::affective, Adjusting, Tolerating)
##D df2 <- select(psycho::affective, -Adjusting, -Tolerating)
##D cor <- bayes_cor(df, df2)
##D summary(cor)
##D print(cor)
##D plot(cor)
## End(Not run)




