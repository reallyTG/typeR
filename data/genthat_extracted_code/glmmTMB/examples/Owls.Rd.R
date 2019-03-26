library(glmmTMB)


### Name: Owls
### Title: Begging by Owl Nestlings
### Aliases: Owls OwlModel OwlModel_nb1_bs OwlModel_nb1_bs_mcmc
### Keywords: datasets

### ** Examples

data(Owls, package = "glmmTMB")
require("lattice")
bwplot(reorder(Nest,NegPerChick) ~ NegPerChick | FoodTreatment:SexParent,
       data=Owls)
dotplot(reorder(Nest,NegPerChick) ~ NegPerChick| FoodTreatment:SexParent,
        data=Owls)
## Not run: 
##D ## Fit negative binomial model with "constant" Zero Inflation :
##D owls_nb1 <- glmmTMB(SiblingNegotiation ~ FoodTreatment*SexParent +
##D                                     (1|Nest)+offset(log(BroodSize)),
##D               family = nbinom1(), zi = ~1, data=Owls)
##D owls_nb1_bs <- update(owls_nb1,
##D                       . ~ . - offset(log(BroodSize)) + log(BroodSize))
##D fixef(owls_nb1_bs)
## End(Not run)



