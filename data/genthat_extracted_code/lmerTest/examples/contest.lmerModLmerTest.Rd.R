library(lmerTest)


### Name: contest.lmerModLmerTest
### Title: Test of Contrasts
### Aliases: contest.lmerModLmerTest contest.lmerMod

### ** Examples


data("sleepstudy", package="lme4")
fm <- lmer(Reaction ~ Days + I(Days^2) + (1|Subject) + (0+Days|Subject),
           sleepstudy)
# F-test of third coeffcients - I(Days^2):
contest(fm, c(0, 0, 1))
# Equivalent t-test:
contest(fm, L=c(0, 0, 1), joint=FALSE)
# Test of 'Days + I(Days^2)':
contest(fm, L=diag(3)[2:3, ])
# Other options:
contest(fm, L=diag(3)[2:3, ], joint=FALSE)
contest(fm, L=diag(3)[2:3, ], joint=FALSE, collect=FALSE)

# Illustrate a list argument:
L <- list("First"=diag(3)[3, ], "Second"=diag(3)[-1, ])
contest(fm, L)
contest(fm, L, collect = FALSE)
contest(fm, L, joint=FALSE, confint = FALSE)
contest(fm, L, joint=FALSE, collect = FALSE, level=0.99)

# Illustrate testing of estimability:
# Consider the 'cake' dataset with a missing cell:
data("cake", package="lme4")
cake$temperature <- factor(cake$temperature, ordered=FALSE)
cake <- droplevels(subset(cake, temperature %in% levels(cake$temperature)[1:2] &
                            !(recipe == "C" & temperature == "185")))
with(cake, table(recipe, temperature))
fm <- lmer(angle ~ recipe * temperature + (1|recipe:replicate), cake)
fixef(fm)
# The coefficient for recipeC:temperature185 is dropped:
attr(model.matrix(fm), "col.dropped")
# so any contrast involving this coefficient is not estimable:
Lmat <- diag(6)
contest(fm, Lmat, joint=FALSE, check_estimability = TRUE)




