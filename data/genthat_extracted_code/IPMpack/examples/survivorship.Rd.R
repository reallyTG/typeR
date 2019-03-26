library(IPMpack)


### Name: survivorship
### Title: Estimates survivorship between two time censuses.
### Aliases: survivorship

### ** Examples

# For only continuous stages (e.g. size)
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff))
su <- survivorship(Pmatrix, 1, 300)
plot(su$surv.curv, type = "l", col = "dark gray", ylab = "survivorship", 
xlab= "Continuous (e.g. size) stage", ylim = c(0,1))

# For continuous (e.g. size) and discrete (e.g. seedbank) stages
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size,na.rm = TRUE),
maxSize = max(dff$size,na.rm = TRUE), envMatrix = makeEnvObj(dff),
growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate),
survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate), 
discreteTrans = 1)
su <- survivorship(Pmatrix,1,300)



