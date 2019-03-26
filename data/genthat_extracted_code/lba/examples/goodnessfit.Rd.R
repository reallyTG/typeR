library(lba)


### Name: goodnessfit
### Title: Goodness of Fit results for Latent Budget Analysis
### Aliases: goodnessfit goodnessfit.default goodnessfit.lba.ls
###   goodnessfit.lba.ls.fe goodnessfit.lba.ls.logit goodnessfit.lba.mle
###   goodnessfit.lba.mle.fe goodnessfit.lba.mle.logit

### ** Examples

data('votB')

# Using LS method (default) without constraint
# K = 2
ex1 <- lba(parties ~ city,
           votB,
           K = 2)

gx1 <- goodnessfit(ex1)
gx1

# Using MLE method without constraint
# K = 2
exm <- lba(parties ~ city,
           votB,
           K = 2,
           method='mle')

gxm <- goodnessfit(exm)
gxm

# Using LS method (default) with LOGIT constrain
data('housing')

# Make cross-table to matrix design.
tbh <- xtabs(value ~ Influence + Housing, housing)

Xis <- model.matrix(~ Housing*Influence,
                    tbh,
                    contrasts=list(Housing='contr.sum',
                                   Influence='contr.sum'))

tby <- xtabs(value ~ Satisfaction + Contact, housing)

Yis <- model.matrix(~ Satisfaction*Contact,
                    tby,
                    contrasts=list(Satisfaction='contr.sum',
                                   Contact='contr.sum'))[,-1]

S <- 12
T <- 5

tabs <- xtabs(value ~ interaction(Housing,
                                  Influence) + interaction(Satisfaction,
                                  Contact),
              housing)
## Not run: 
##D ex2 <- lba(tabs,
##D            K = 2,
##D            logitA = Xis,
##D            logitB = Yis,
##D            S = S,
##D            T = T,
##D            trace.lba=FALSE) 
##D 
##D gex2 <- goodnessfit(ex2)
##D gex2
## End(Not run)



