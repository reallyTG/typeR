library(COUNT)


### Name: nuts
### Title: nuts
### Aliases: nuts
### Keywords: datasets

### ** Examples

data(nuts)
nut <- subset(nuts, dbh < 0.6)
# sntrees <- scale(nuts$ntrees)
# sheigtht <- scale(nuts$height)
# scover <- scale(nuts$cover)
summary(PO <- glm(cones ~ sntrees + sheight + scover, family=quasipoisson, data=nut))



