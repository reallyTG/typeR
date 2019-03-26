library(HistData)


### Name: Dactyl
### Title: Edgeworth's counts of dactyls in Virgil's Aeneid
### Aliases: Dactyl
### Keywords: datasets

### ** Examples

data(Dactyl)

# display the basic table
xtabs(count ~ Foot+Lines, data=Dactyl)

# simple two-way anova
anova(dact.lm <- lm(count ~ Foot+Lines, data=Dactyl))

# plot the lm-quartet
op <- par(mfrow=c(2,2))
plot(dact.lm)
par(op)

# show table as a simple mosaicplot
mosaicplot(xtabs(count ~ Foot+Lines, data=Dactyl), shade=TRUE)



