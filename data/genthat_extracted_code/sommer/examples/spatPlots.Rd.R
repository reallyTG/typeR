library(sommer)


### Name: spatPlots
### Title: Spatial plots
### Aliases: spatPlots

### ** Examples

# data("DT_cpdata")
# ### mimic two fields
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
#                 vs(ds(FIELD),spl2D(Row,Col, at=FIELD)),
#             rcov=~vs(ds(FIELD),units),
#             data=DT2)
# summary(mix)$varcomp
# 
# 
# ss <- spatPlots(object=mix, by="FIELD", colfunc=NULL,
#           row="Row",range="Col", wire=FALSE, terms = c("Rowf","Colf","Row"))



