library(lessR)


### Name: ANOVA
### Title: Analysis of Variance
### Aliases: ANOVA av av.brief
### Keywords: regression

### ** Examples



# access the PlantGrowth data frame
ANOVA(weight ~ group, data=PlantGrowth)
#brief version
av.brief(weight ~ group, data=PlantGrowth)

# drop the second treatment, just control and 1 treatment
ANOVA(weight ~ group, data=PlantGrowth, rows=(group != "trt2"))

# variables of interest in a data frame that is not the default d
# two-factor between-groups ANOVA with replications and interaction
# warpbreaks is a data set provided with R
ANOVA(breaks ~ wool * tension, data=warpbreaks)

# randomized blocks design with the second term the blocking factor
# use short name
av(breaks ~ wool + tension, data=warpbreaks)



