library(itsadug)


### Name: get_pca_predictions
### Title: Return PCA predictions.
### Aliases: get_pca_predictions

### ** Examples

data(simdat)
# add hypothetical correlated term:
simdat$predictor <-  (simdat$Trial+10)^.75 + rnorm(nrow(simdat))
# principal components analysis:
pca <- prcomp(simdat[, c("Trial", "predictor")])
# only first PC term contributes:
summary(pca)
# get rotation (weights of predictors in PC):
pcar <- pca$rotation
# add PC1 to data:
simdat$PC1 <- pca$x[,1]

## Not run: 
##D # model:
##D m1 <- bam(Y ~ Group + te(Time, PC1, by=Group) 
##D     + s(Time, Subject, bs='fs', m=1, k=5), data=simdat)
##D # inspect surface:
##D fvisgam(m1, view=c("Time", "PC1"), cond=list(Group="Children"),
##D     rm.ranef=TRUE)
##D # how does Trial contribute?
##D p <- get_pca_predictions(m1, pca.term="PC1", weights=pcar[,"PC1"], 
##D     view=c("Time", "Trial"), cond=list(Group="Children"),
##D     rm.ranef=TRUE, partial=FALSE)
##D # Note that the range of Trial is estimated based on the values of PC1.
##D # A better solution is to specify the range:
##D p <- get_pca_predictions(m1, pca.term="PC1", weights=pcar[,"PC1"], 
##D     view=list(Time=range(simdat$Time), Trial=range(simdat$Trial)), 
##D     cond=list(Group="Children"),rm.ranef=TRUE, partial=FALSE)
##D # plotting of the surface:
##D plot_pca_surface(m1, pca.term="PC1", weights=pcar[,"PC1"], 
##D     view=c("Time", "Trial"), cond=list(Group="Children"),rm.ranef=TRUE)
## End(Not run)



