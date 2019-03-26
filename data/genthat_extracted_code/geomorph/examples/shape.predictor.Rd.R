library(geomorph)


### Name: shape.predictor
### Title: Shape prediction from numeric predictors
### Aliases: shape.predictor

### ** Examples

# Examples using Plethodon data

data("plethodon")

Y.gpa <- gpagen(plethodon$land)    #GPA-alignment    
plotTangentSpace(Y.gpa$coords)

preds <- shape.predictor(Y.gpa$coords, x= NULL, Intercept = FALSE, 
pred1 = -0.1, pred2 = 0.1) # PC 1 extremes, sort of
M <- mshape(Y.gpa$coords)
plotRefToTarget(M, preds$pred1)
plotRefToTarget(M, preds[[1]]) # same result
plotRefToTarget(M, preds$pred2)

PCA <- plotTangentSpace(Y.gpa$coords)
PC <- PCA$pc.scores[,1]
preds <- shape.predictor(Y.gpa$coords, x= PC, Intercept = FALSE, 
pred1 = min(PC), pred2 = max(PC)) # PC 1 extremes, more technically
plotRefToTarget(M, preds$pred1)
plotRefToTarget(M, preds$pred2)

PC <- PCA$pc.scores[,1:2]
# user-picked spots - can be anything, but it in this case, apparent groups
preds <- shape.predictor(Y.gpa$coords, x= PC, Intercept = FALSE, 
                        pred1 = c(0.045,-0.02), pred2 = c(-0.025,0.06), pred3 = c(-0.06,-0.04)) 
plotRefToTarget(M, preds$pred1)
plotRefToTarget(M, preds$pred2)
plotRefToTarget(M, preds$pred3)

# allometry example - straight-up allometry

preds <- shape.predictor(Y.gpa$coords, x= log(Y.gpa$Csize), Intercept = TRUE, 
                        predmin = min(log(Y.gpa$Csize)), predmax = max(log(Y.gpa$Csize))) 

plotRefToTarget(M, preds$predmin, mag=3)
plotRefToTarget(M, preds$predmax, mag=3)

# allometry example - using RegScore or PredLine via procD.allometry

gdf <- geomorph.data.frame(Y.gpa)
plethAllometry <- procD.allometry(coords~Csize, data=gdf, logsz = TRUE)
plot(plethAllometry, method="RegScore")
preds <- shape.predictor(plethAllometry$Ahat, x= plethAllometry$Reg.proj, Intercept = FALSE, 
                        predmin = min(plethAllometry$Reg.proj), 
                        predmax = max(plethAllometry$Reg.proj)) 
plotRefToTarget(M, preds$predmin, mag=3)
plotRefToTarget(M, preds$predmax, mag=3)

plot(plethAllometry, method="PredLine")
preds <- shape.predictor(plethAllometry$Ahat, x= plethAllometry$pred.val, Intercept = FALSE, 
                        predmin = min(plethAllometry$pred.val), 
                        predmax = max(plethAllometry$pred.val)) 
plotRefToTarget(M, preds$predmin, mag=3)
plotRefToTarget(M, preds$predmax, mag=3)

# using factors via PCA

gdf <- geomorph.data.frame(Y.gpa, species = plethodon$species, site = plethodon$site)
pleth <- procD.lm(coords ~ species*site, data=gdf)
PCA <- prcomp(pleth$fitted)
plot(PCA$x, asp=1, pch=19)

means <- unique(round(PCA$x,3))
means # note: suggests 3 PCs useful enough

preds <- shape.predictor(arrayspecs(pleth$fitted, 12,2), x= PCA$x[,1:3],
                        Intercept = FALSE,
                        pred1 = means[1,1:3], 
                        pred2 = means[2,1:3],
                        pred3 = means[3,1:3], 
                        pred4 = means[4,1:3])                   
plotRefToTarget(M, preds$pred1, mag=2)
plotRefToTarget(M, preds$pred2, mag=2)
plotRefToTarget(M, preds$pred3, mag=2)
plotRefToTarget(M, preds$pred4, mag=2)

# Using a design matrix for factors

X <- pleth$X
X # includes intercept; remove for better functioning 
X <- X[,-1]
symJord <- c(0,1,0) # design for P. Jordani in sympatry
alloJord <- c(0,0,0) # design for P. Jordani in allopatry
preds <- shape.predictor(arrayspecs(pleth$fitted, 12,2), x = X, Intercept = TRUE, 
                        symJord=symJord, alloJord=alloJord)
plotRefToTarget(M, preds$symJord, mag=2)
plotRefToTarget(M, preds$alloJord, mag=2)

# PLS Example

data(plethShapeFood) 
Y.gpa<-gpagen(plethShapeFood$land)    #GPA-alignment    

# 2B-PLS between head shape and food use data
PLS <-two.b.pls(plethShapeFood$food,Y.gpa$coords, iter=999) 
summary(PLS)
plot(PLS)

preds <- shape.predictor(Y.gpa$coords, plethShapeFood$food, Intercept = FALSE,
                        method = "PLS",
                        pred1 = 2, pred2 = -4, pred3 = 2.5) # using PLS plot as a guide
M <- mshape(Y.gpa$coords)
plotRefToTarget(M, preds$pred1, mag=2)
plotRefToTarget(M, preds$pred2, mag=2)
plotRefToTarget(M, preds$pred3, mag=2)




