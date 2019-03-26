library(pan)


### Name: ecme
### Title: ECME algorithm for general linear mixed model
### Aliases: ecme
### Keywords: models

### ** Examples

########################################################################
# A simple linear model to these data using ecme(). This will be a
# traditional repeated-measures style additive model with a fixed effect
# for each column (occasion) and a random intercept for each subject.
#
# The data to be used is contained the object marijuana. Since the six
# measurements per subject were not clearly ordered in time, we consider
# a model that has an intercept and five dummy codes to allow the
# population means for the six occasions to be estimated freely together
# with an intercept randomly varied by subject. For a subject i with no
# missing values, the covariate matrices will be
#
#                   1 1 0 0 0 0              1
#                   1 0 1 0 0 0              1
#           Xi =    1 0 0 1 0 0       Zi =   1
#                   1 0 0 0 1 0              1
#                   1 0 0 0 0 1              1
#                   1 0 0 0 0 0              1
#
# When using ecme(), these are combined into a single matrix called
# pred. The pred matrix has length(y) rows. Each column of Xi and Zi
# must be represented in pred. Because Zi is merely the first column
# of Xi, we do not need to enter that column twice. So pred is simply
# the matrices Xi (i=1,...,9), stacked upon each other.
#
data(marijuana)
# we only use the complete data to illustrate
complete <- subset(marijuana,!is.na(y))
attach(complete)
pred <- with(complete,cbind(int,dummy1,dummy2,dummy3,dummy4,dummy5))
xcol <- 1:6
zcol <- 1
# Now we can fit the model.
result <- ecme(y,subj,occ,pred,xcol,zcol)
result

# Now we compare to lmer
if(require(lme4)) {
result <- lmer(y~-1+pred+(1|subj))
result
vcov(result)
detach(complete)
}
########################################################################



