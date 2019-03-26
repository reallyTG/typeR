library(meta)


### Name: woodyplants
### Title: Elevated CO_2 and total biomass of woody plants
### Aliases: woodyplants
### Keywords: datasets

### ** Examples

data(woodyplants)

# Meta-analysis of response ratios (Hedges et al., 1999)
#
meta8 <- metacont(n.elev, mean.elev, sd.elev,
                  n.amb, mean.amb, sd.amb,
                  data=woodyplants, sm="ROM",
                  studlab=paste(obsno, papno, sep = " / "))
summary(meta8, prediction=TRUE)

# Meta-analysis for plants grown with low soil fertility treatment
#
meta9 <- update(meta8, subset=(treat=="fert"&level=="low"))
summary(meta9, prediction=TRUE)

# Meta-analysis for plants grown under low light conditions
#
meta10 <- update(meta8, subset=(treat=="light"&level=="low"))
summary(meta10, prediction=TRUE)



