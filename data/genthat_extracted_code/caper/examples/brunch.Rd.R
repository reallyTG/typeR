library(caper)


### Name: brunch
### Title: Comparative analysis using the brunch algorithm.
### Aliases: brunch
### Keywords: models regression

### ** Examples

data(perissodactyla)
perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial)
brunchMod <- brunch(log.female.wt ~ Territoriality, data=perisso)
summary(brunchMod)

# plot the contrasts
brunchTab <- caic.table(brunchMod)
plot(log.female.wt ~ Territoriality, brunchTab)

# for the actual model diagnostics
par(mfrow=c(3,1))
caic.diagnostics(brunchMod)




