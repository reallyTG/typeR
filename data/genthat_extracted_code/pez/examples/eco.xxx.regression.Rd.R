library(pez)


### Name: eco.xxx.regression
### Title: eco.xxx.regression
### Aliases: eco.env.regression eco.phy.regression eco.trait.regression
###   eco.xxx.regression plot.eco.xxx.regression print.eco.xxx.regression
###   summary.eco.xxx.regression

### ** Examples

data(laja)
#We wouldn't recommend only using ten permutations - this is just for speed!
data <- comparative.comm(invert.tree, river.sites, invert.traits, river.env)
eco.trait.regression(data, permute=10)
#Specify additional options
eco.trait.regression(data, tau=c(0.25,0.5,0.75), permute=10)
plot(eco.trait.regression(data, permute=10, method="lm"))
plot(eco.trait.regression(data, permute=10, method="lm", altogether=FALSE))



