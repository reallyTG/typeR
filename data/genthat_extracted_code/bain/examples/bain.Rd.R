library(bain)


### Name: bain
### Title: Bayes factors for informative hypotheses
### Aliases: bain

### ** Examples

# USING BAIN WITH A LM OBJECT: Bayesian ANOVA
# make a factor of variable site
sesamesim$site <- as.factor(sesamesim$site)
# execute an analysis of variance using lm() which, due to the -1, returns
# estimates of the means per group
anov <- lm(postnumb~site-1,sesamesim)
# take a look at the estimated means and their names
coef(anov)
# set a seed value
set.seed(100)
# use the names to formulate and test hypotheses with bain
results <- bain(anov, "site1=site2=site3=site4=site5; site2>site5>site1>
site3>site4")
#
# USING BAIN WITH A NAMED VECTOR: Bayesian ANOVA

# make a factor of variable site
sesamesim$site <- as.factor(sesamesim$site)
# execute an analysis of variance using lm() which, due to the -1, returns
# estimates of the means per group
anov <- lm(postnumb~site-1,sesamesim)
# collect the estimates means in a vector
estimate <- coef(anov)
# give names to the estimates in anov
names(estimate) <- c("site1", "site2", "site3","site4","site5")
# create a vector containing the sample sizes of each group
ngroup <- table(sesamesim$site)
# compute the variance of the means and collect them in a list
var <- summary(anov)$sigma**2
cov1 <- matrix(var/ngroup[1], nrow=1, ncol=1)
cov2 <- matrix(var/ngroup[2], nrow=1, ncol=1)
cov3 <- matrix(var/ngroup[3], nrow=1, ncol=1)
cov4 <- matrix(var/ngroup[4], nrow=1, ncol=1)
cov5 <- matrix(var/ngroup[5], nrow=1, ncol=1)
covlist <- list(cov1, cov2, cov3, cov4,cov5)
# set a seed value
set.seed(100)
# test hypotheses with bain. Note that there are multiple groups
# characterized by one mean, therefore group_parameters=1. Note that
# there are no joint parameters, therefore, joint_parameters=0.
results <- bain(estimate,
"site1=site2=site3=site4=site5; site2>site5>site1>site3>site4",
n=ngroup,Sigma=covlist,group_parameters=1,joint_parameters = 0)

# SEE THE TUTORIAL AND VIGNETTE FOR MANY ADDITIONAL EXAMPLES





