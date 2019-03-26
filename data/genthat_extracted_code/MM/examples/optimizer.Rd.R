library(MM)


### Name: optimizer
### Title: Maximum likelihood estimator for the MM
### Aliases: optimizer optimizer_allsamesum optimizer_differsums

### ** Examples

data(voting)
p1 <- Lindsey(voting,voting_tally)
p2 <- optimizer(voting,voting_tally,start=p1)

theta(p1) - theta(p2)   # Should be zero

## Not run: 
##D data(pollen)
##D p1 <- optimizer(pollen)
##D p2 <- Lindsey(pollen)
##D theta(p1) - theta(p2)   #  Isn't zero...numerical scruff...
## End(Not run)




