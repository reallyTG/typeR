library(influence.SEM)


### Name: explore.influence
### Title: Explores case influence.
### Aliases: explore.influence
### Keywords: graphics

### ** Examples

data("PDII")
model <- "
F1 =~ y1+y2+y3+y4
"
fit0 <- sem(model, data=PDII,std.lv=TRUE)
## not run
# gCD <- genCookDist(model,data=PDII,std.lv=TRUE)
# explore.influence(gCD,cook=TRUE)

##
## not run: this example take several minutes
model <- "
F1 =~ x1+x2+x3
F2 =~ y1+y2+y3+y4
F3 =~ y5+y6+y7+y8
"

# fit0 <- sem(model, data=PDII)
# FI <- fitinfluence('rmsea',model,PDII)
# explore.influence(FI)



