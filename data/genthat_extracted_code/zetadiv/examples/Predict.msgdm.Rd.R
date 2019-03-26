library(zetadiv)


### Name: Predict.msgdm
### Title: Predict zeta values for new environmental and distance data
### Aliases: Predict.msgdm

### ** Examples

utils::data(bird.spec.fine)
xy.bird <- bird.spec.fine[1:500,1:2]
data.spec.bird <- bird.spec.fine[1:500,3:192]
utils::data(bird.env.fine)
data.env.bird <- bird.env.fine[1:500,3:9]

zeta.glm <- Zeta.msgdm(data.spec.bird, data.env.bird, sam = 100, order = 3)
newdata <- data.frame(matrix(NA,100,ncol(data.env.bird)))
names(newdata) <- names(data.env.bird)
for(z in 1:100){
  samp <- sample(1:104, 3, replace = FALSE)
  newdata[z,] <- apply(apply(bird.env.fine[501:604,3:9][samp,], 2,
     stats::dist), 2, mean)
}
##rescale the data like during MS-GDM
newdata <- newdata/matrix(rep(zeta.glm$rescale.factor,100),
   100,length(zeta.glm$rescale.factor),byrow=TRUE)
new.zeta.glm <- Predict.msgdm(model.msgdm = zeta.glm$model, reg.type = "glm",
   newdata = newdata)



zeta.ngls <- Zeta.msgdm(data.spec.bird, data.env.bird, sam = 100, order = 3,
   reg.type = "ngls", normalize = "Jaccard")
newdata <- data.frame(matrix(NA,100,ncol(data.env.bird)))
names(newdata) <- names(data.env.bird)
for(z in 1:100){
  samp <- sample(1:104, 3, replace = FALSE)
  newdata[z,] <- apply(apply(bird.env.fine[501:604,3:9][samp,], 2, stats::dist),
     2, mean)
}
##rescale the data like during MS-GDM
newdata <- newdata/matrix(rep(zeta.ngls$rescale.factor,100),
   100,length(zeta.ngls$rescale.factor),byrow=TRUE)
new.zeta.ngls <- Predict.msgdm(model.msgdm = zeta.ngls$model, reg.type = "ngls",
   newdata = newdata)



