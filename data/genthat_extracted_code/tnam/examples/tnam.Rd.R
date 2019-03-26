library(tnam)


### Name: tnam
### Title: Fit (temporal) network autocorrelation models
### Aliases: tnam tnamdata

### ** Examples

# The following example models delinquency among adolescents at 
# multiple time steps as a function of (1) their nodal attributes 
# like sex or religion, (2) their peers' delinquency levels, (3) 
# their own and their peers' past delinquency behavior, and (4) 
# their structural position in the network. See ?knecht for 
# details on the dataset. Before estimating the model, all data 
# should be labeled with the names of the nodes such that tnam 
# is able to merge the information on multiple nodes across time 
# points.

library("tnam")
data("knecht")

# prepare the dependent variable y
delinquency <- as.data.frame(delinquency)
rownames(delinquency) <- letters

# replace structural zeros (denoted as 10) and add row labels
friendship[[3]][friendship[[3]] == 10] <- NA
friendship[[4]][friendship[[4]] == 10] <- NA
for (i in 1:length(friendship)) {
  rownames(friendship[[i]]) <- letters
}

# prepare the covariates sex and religion
sex <- demographics$sex
names(sex) <- letters
sex <- list(t1 = sex, t2 = sex, t3 = sex, t4 = sex)
religion <- demographics$religion
names(religion) <- letters
religion <- list(t1 = religion, t2 = religion, t3 = religion, 
    t4 = religion)

# Estimate the model. The first term is the sex of the respondent, 
# the second term is the religion of the respondent, the third 
# term is the previous delinquency behavior of the respondent, 
# the fourth term is the delinquency behavior of direct friends, 
# the fifth term is the delinquency behavior of indirect friends 
# at a path distance of 2, the sixth effect is the past delinquency 
# of direct friends, the seventh term indicates whether the 
# respondent has any contacts at all, and the last term captures 
# the effect of the betweenness centrality of the respondent on 
# his or her behavior. Apparently, previous behavior, being an 
# isolate, and religion seem to have an effect on delinquency in 
# this dataset. There is also a slight positive trend over time, 
# and direct friends exert a minor effect (not significant).
# Note that a linear model may not be the best specification for 
# modeling the ordered categorical delinquency variable, but it 
# suffice here for illustration purposes.

model1 <- tnam(
    delinquency ~ 
    covariate(sex, coefname = "sex") + 
    covariate(religion, coefname = "religion") + 
    covariate(delinquency, lag = 1, exponent = 1) + 
    netlag(delinquency, friendship) + 
    netlag(delinquency, friendship, pathdist = 2, decay = 1) + 
    netlag(delinquency, friendship, lag = 1) + 
    degreedummy(friendship, deg = 0, reverse = TRUE) + 
    centrality(friendship, type = "betweenness"), 
    re.node = TRUE, time.linear = TRUE
)
summary(model1)

# for nice table output, use the texreg package
library("texreg")
screenreg(model1)



