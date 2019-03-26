library(CDM)


### Name: IRT.factor.scores
### Title: S3 Methods for Extracting Factor Scores (Person Classifications)
### Aliases: IRT.factor.scores IRT.factor.scores.din
###   IRT.factor.scores.gdina IRT.factor.scores.mcdina
###   IRT.factor.scores.gdm IRT.factor.scores.slca
### Keywords: Factor scores

### ** Examples

#############################################################################
# EXAMPLE 1: Extracting factor scores in the DINA model
#############################################################################

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

# estimate DINA model
mod1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix)
summary(mod1)
# MLE
fsc1a <- CDM::IRT.factor.scores(mod1)
# MAP
fsc1b <- CDM::IRT.factor.scores(mod1, type="MAP")
# EAP
fsc1c <- CDM::IRT.factor.scores(mod1, type="EAP")
# compare classification for skill 1
stats::xtabs( ~ fsc1a[,1] + fsc1b[,1] )
graphics::boxplot( fsc1c[,1] ~ fsc1a[,1] )



