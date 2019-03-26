library(sirt)


### Name: lc.2raters
### Title: Latent Class Model for Two Exchangeable Raters and One Item
### Aliases: lc.2raters summary.lc.2raters
### Keywords: summary Rater model Latent class model

### ** Examples

#############################################################################
# EXAMPLE 1: Latent class models for rating datasets data.si05
#############################################################################

data(data.si05)

#*** Model 1: one item with two categories
mod1 <- sirt::lc.2raters( data.si05$Ex1)
summary(mod1)

#*** Model 2: one item with five categories
mod2 <- sirt::lc.2raters( data.si05$Ex2)
summary(mod2)

#*** Model 3: one item with eight categories
mod3 <- sirt::lc.2raters( data.si05$Ex3)
summary(mod3)



