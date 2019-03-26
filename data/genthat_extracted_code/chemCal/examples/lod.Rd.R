library(chemCal)


### Name: lod
### Title: Estimate a limit of detection (LOD)
### Aliases: lod lod.lm lod.rlm lod.default
### Keywords: manip

### ** Examples

m <- lm(y ~ x, data = din32645)
lod(m) 

# The critical value (decision limit, German Nachweisgrenze) can be obtained
# by using beta = 0.5:
lod(m, alpha = 0.01, beta = 0.5)



