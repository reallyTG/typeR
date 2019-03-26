library(mcglm)


### Name: mc_mixed
### Title: Mixed Models Structure
### Aliases: mc_mixed

### ** Examples

SUBJECT <- gl(2, 6)
x1 <- rep(1:6, 2)
x2 <- rep(gl(2,3),2)
data <- data.frame(SUBJECT, x1 , x2)
# Compound symmetry structure
mc_mixed(~0 + SUBJECT, data = data)
# Compound symmetry + random slope for x1 and interaction or correlation
mc_mixed(~0 + SUBJECT/x1, data = data)
# Compound symmetry + random slope for x1 and x2 plus interactions
mc_mixed(~0 + SUBJECT/(x1 + x2), data = data)




