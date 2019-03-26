library(aster)


### Name: anova.asterOrReaster
### Title: Analysis of Deviance for Reaster Model Fits
### Aliases: anova.asterOrReaster anovaAsterOrReasterList anova.aster
###   anova.reaster
### Keywords: models regression

### ** Examples

### see package vignette for explanation ###
library(aster)
data(echinacea)
vars <- c("ld02", "ld03", "ld04", "fl02", "fl03", "fl04",
    "hdct02", "hdct03", "hdct04")
redata <- reshape(echinacea, varying = list(vars), direction = "long",
    timevar = "varb", times = as.factor(vars), v.names = "resp")
redata <- data.frame(redata, root = 1)
pred <- c(0, 1, 2, 1, 2, 3, 4, 5, 6)
fam <- c(1, 1, 1, 1, 1, 1, 3, 3, 3)
hdct <- grepl("hdct", as.character(redata$varb))
redata <- data.frame(redata, hdct = as.integer(hdct))
level <- gsub("[0-9]", "", as.character(redata$varb))
redata <- data.frame(redata, level = as.factor(level))
aout1 <- aster(resp ~ varb + hdct : (nsloc + ewloc + pop),
    pred, fam, varb, id, root, data = redata)
aout2 <- aster(resp ~ varb + level : (nsloc + ewloc) + hdct : pop,
    pred, fam, varb, id, root, data = redata)
aout3 <- aster(resp ~ varb + level : (nsloc + ewloc + pop),
    pred, fam, varb, id, root, data = redata)
anova(aout1, aout2, aout3)

# now random effects models and models without random effects mixed
## Not run: 
##D ### CRAN policy says examples must take < 5 sec.
##D ### This doesn't (on their computers).
##D data(radish)
##D pred <- c(0,1,2)
##D fam <- c(1,3,2)
##D rout2 <- reaster(resp ~ varb + fit : (Site * Region),
##D     list(block = ~ 0 + fit : Block, pop = ~ 0 + fit : Pop),
##D     pred, fam, varb, id, root, data = radish)
##D rout1 <- reaster(resp ~ varb + fit : (Site * Region),
##D     list(block = ~ 0 + fit : Block),
##D     pred, fam, varb, id, root, data = radish)
##D rout0 <- aster(resp ~ varb + fit : (Site * Region),
##D     pred, fam, varb, id, root, data = radish)
##D anova(rout0, rout1, rout2)
## End(Not run)



