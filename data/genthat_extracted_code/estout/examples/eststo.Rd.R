library(estout)


### Name: eststo
### Title: Estimates Storage
### Aliases: eststo

### ** Examples

## Not run: 
##D B <- read.table("../data/bwght.tab",header=TRUE)
##D attach(B)
##D 
##D 
##D b.cigs.motheduc <- lm(bwght ~ cigs + motheduc)
##D b.cigs.faminc <- lm(bwght ~ cigs + faminc)
##D b.cigs.motheduc.faminc <- lm(bwght ~ cigs + motheduc + faminc)
##D 
##D eststo(b.cigs.motheduc)
##D eststo(b.cigs.faminc)
##D eststo(b.cigs.motheduc.faminc)
##D 
##D eststo(model1,store="tab2")
##D eststo(model2,store="tab2")
##D eststo(model3,store="tab2")
## End(Not run)



