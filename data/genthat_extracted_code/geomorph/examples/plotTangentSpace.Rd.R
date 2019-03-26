library(geomorph)


### Name: plotTangentSpace
### Title: Plot specimens in tangent space
### Aliases: plotTangentSpace
### Keywords: visualization

### ** Examples

data(plethodon) 
Y.gpa<-gpagen(plethodon$land)    #GPA-alignment

gp <- interaction(plethodon$species, plethodon$site) # group must be a factor
plotTangentSpace(Y.gpa$coords, groups = gp) 

## To save and use output
PCA <- plotTangentSpace(Y.gpa$coords, groups = gp, legend=TRUE) 
summary(PCA)
PCA$pc.shapes
PCA$rotation

##To change colors of groups
col.gp <- rainbow(length(levels(gp))) 
   names(col.gp) <- levels(gp)
col.gp <- col.gp[match(gp, names(col.gp))] # col.gp must NOT be a factor
plotTangentSpace(Y.gpa$coords, groups = col.gp)

## To plot residual shapes from an allometry regression (note: must add mean back in!) 
plotTangentSpace(arrayspecs(resid(lm(two.d.array(Y.gpa$coords)~Y.gpa$Csize))+
         predict(lm(two.d.array(Y.gpa$coords)~1)),12,2))



