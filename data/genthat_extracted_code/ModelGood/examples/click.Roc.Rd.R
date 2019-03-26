library(ModelGood)


### Name: click.Roc
### Title: Click on ROC curve
### Aliases: click.Roc

### ** Examples

## Not run: 
##D x <- abs(rnorm(20))
##D d <- data.frame(y=rbinom(1:20,1,p=x/max(x)))
##D r <- Roc(y~x,data=d)
##D plot(r)
##D click.Roc(r)
##D  
## End(Not run)



