library(DescTools)


### Name: TwoGroups
### Title: Describe a Variable by a Factor with Two Levels
### Aliases: TwoGroups
### Keywords: "print" "multivariate" "distribution"

### ** Examples

x <- d.pizza$temperature
g <- factor(d.pizza$rabate)

# we can change the colors for the plot by setting the DescToolsOptions
DescToolsOptions(col=c(horange, hgreen))
TwoGroups(x, g, main="Temperature ~ Rebate")

# for an output to Word simply define the wrd argument
# wrd <- GetNewWrd()
# TwoGroups(x, g, font.desc=list(name="Consolas", size=8),
#           main="Temperature ~ Rebate", wrd=wrd)



