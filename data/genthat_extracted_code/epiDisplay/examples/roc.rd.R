library(epiDisplay)


### Name: ROC
### Title: ROC curve
### Aliases: lroc roc.from.table
### Keywords: array

### ** Examples

# Single ROC curve from logistic regression
# Note that 'induced' and 'spontaneous' are both originally continuous variables
model1 <- glm(case ~ induced + spontaneous, data=infert, family=binomial)
logistic.display(model1)
# Having two spontaneous abortions is quite close to being infertile!
# This is actually not a causal relationship

lroc(model1, title=TRUE, auc.coords=c(.5,.1))
# For PowerPoint presentation, the graphic elements should be enhanced as followed 
lroc(model1, title=TRUE, cex.main=2, cex.lab=1.5, col.lab="blue", cex.axis=1.3, 
lwd=3)
lroc1 <- lroc(model1) # The main title and auc text have disappeared
model2 <- glm(case ~ spontaneous, data=infert, family=binomial)
logistic.display(model2)
lroc2 <- lroc(model2, add=TRUE, line.col="brown", lty=2)
legend("bottomright",legend=c(lroc1$model.description, lroc2$model.description),
        lty=1:2, col=c("red","brown"), bg="white")
title(main="Comparison of two logistic regression models")
lrtest(model1, model2) 
# Number of induced abortions is associated with increased risk for infertility

# Various form of logistic regression
# Case by case data
data(ANCdata)
.data <- ANCdata
glm1 <- glm(death ~ anc + clinic, binomial, data=.data) # Note 'calc'
lroc(glm1)

# Frequency format
data(ANCtable)
ANCtable
.data <- ANCtable
attach(.data)
death <- factor (death)
levels (death) <- c("no","yes")
anc <- with(.data, factor (anc))
levels (anc) <- c("old","new")
clinic <- with(.data, factor (clinic))
levels (clinic) <- c("A","B")
.data <- data.frame(death, anc, clinic)
.data
glm2 <- glm(death ~ anc + clinic, binomial, weights=Freq, data=.data)
lroc(glm2)
detach(.data)

# ROC from a diagnostic table
table1 <- as.table(cbind(c(1,27,56,15,1),c(0,0,10,69,21)))
colnames(table1) <- c("Non-diseased", "Diseased")
rownames(table1) <- c("15-29","30-44","45-59","60-89","90+")
table1
roc.from.table(table1)
roc.from.table(table1, title=TRUE, auc.coords=c(.4,.1), cex=1.2)

# Application of the returned list
roc1 <- roc.from.table(table1, graph=FALSE)
cut.points <- rownames(roc1$diagnostic.table)
text(x=roc1$diagnostic.table[,1], y=roc1$diagnostic.table[,2], 
	labels=cut.points, cex=1.2, col="brown")
rm(list=ls())



