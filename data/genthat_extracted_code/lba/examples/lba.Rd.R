library(lba)


### Name: lba
### Title: Latent Budget Analysis (LBA) for Compositional Data
### Aliases: lba lba.matrix lba.table lba.formula lba.ls lba.mle lba.ls.fe
###   lba.mle.fe lba.ls.logit lba.mle.logit lba.default

### ** Examples

data('votB')

# Using LS method (default) without constraint
# K = 2
ex1 <- lba(parties ~ city,
           votB,
           K = 2)
ex1 

# Already tabulated data? Ok!
data('PerfMark') 

## Not run: 
##D ex2 <- lba(as.matrix(PerfMark),
##D            K = 2,
##D            what='outer')
##D ex2
## End(Not run)
# Using LS method (default) with constraint
# Fixed constraint to mixing parameters
cakiF1 <- matrix(c(0.2, NA, NA,
                   NA , NA,0.2,
                   NA , NA,0.2,
                   0.3, NA, NA,
                   0.2, NA, NA,
                   NA , NA, NA),
                 byrow = TRUE,
                 ncol  = 3)  

# K = 3
## Not run: 
##D exf1 <- lba(parties ~ city,
##D             votB,
##D             cA = cakiF1,
##D             K = 3)
##D exf1 
## End(Not run)
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
##D exlogit2 <- lba(tabs,
##D            K = 2,
##D            logitA = Xis,
##D            logitB = Yis,
##D            S = S,
##D            T = T,
##D            trace.lba=FALSE) 
##D exlogit2
## End(Not run)



