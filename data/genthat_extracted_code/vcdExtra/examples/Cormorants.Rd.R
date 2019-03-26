library(vcdExtra)


### Name: Cormorants
### Title: Advertising Behavior by Males Cormorants
### Aliases: Cormorants
### Keywords: datasets

### ** Examples

data(Cormorants)
str(Cormorants)

library(ggplot2)
ggplot(Cormorants, aes(count)) + geom_histogram(binwidth=0.5) + 
	labs(x="Number of birds advertising")

# Quick look at the data, on the log scale, for plots of `count ~ week`, 
#   stratified by something else.
library(ggplot2)
ggplot(Cormorants, aes(week, count, color=height)) + geom_jitter() +
	stat_smooth(method="loess", size=2) + scale_y_log10(breaks=c(1,2,5,10)) +
	geom_vline(xintercept=c(4.5, 9.5))

# ### models using week 
fit1 <-glm(count ~ week + station + nest + height + density + tree_health, data=Cormorants,
    family =  poisson)

library(car)
Anova(fit1)
# plot fitted effects
library(effects)
plot(allEffects(fit1))




