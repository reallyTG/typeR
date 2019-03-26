library(zipfR)


### Name: print.lnre
### Title: Printing LNRE Models (zipfR)
### Aliases: print.lnre summary.lnre
### Keywords: print

### ** Examples


# load Brown verbs dataset and estimate lnre models
data(BrownVer.spc)
zm <- lnre("zm",BrownVer.spc)
fzm <- lnre("fzm",BrownVer.spc,exact=FALSE)
gigp <- lnre("gigp",BrownVer.spc)

# look at summaries with either summary or print
summary(zm)
print(zm)

summary(fzm)
print(fzm)

summary(gigp)
print(gigp)




