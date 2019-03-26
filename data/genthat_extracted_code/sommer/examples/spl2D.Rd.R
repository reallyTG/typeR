library(sommer)


### Name: spl2D
### Title: Two-dimensional penalised tensor-product of marginal B-Spline
###   basis.
### Aliases: spl2D

### ** Examples

## ============================ ##
## example to use spl2D() + vs() structure
## ============================ ## 
data("DT_cpdata")
### mimic two fields
# aa <- DT; bb <- DT
# aa$FIELD <- "A";bb$FIELD <- "B"
# set.seed(1234)
# aa$Yield <- aa$Yield + rnorm(length(aa$Yield),0,4)
# DT2 <- rbind(aa,bb)
# head(DT2)
# A <- A.mat(GT)
# mix <- mmer(Yield~1,
#             random=~vs(ds(FIELD),id, Gu=A) +
#               vs(ds(FIELD),Rowf) +
#               vs(ds(FIELD),Colf) +
#                 vs(ds(FIELD),spl2D(Row,Col)),
#             rcov=~vs(ds(FIELD),units),
#             data=DT2)



