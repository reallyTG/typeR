library(ordinalgmifs)


### Name: ordinalgmifs
### Title: Ordinal Generalized Monotone Incremental Forward Stagewise
###   Regression
### Aliases: ordinalgmifs
### Keywords: models regression

### ** Examples

data(hccframe)
# To minimize processing time, MPO_E302_R is coerced into the model and only a subset of 
# two CpG sites (DDIT3_P1313_R and HDAC9_P137_R) are included as penalized covariates
# in this demonstration, and epsilon is set to 0.01
hcc.fit <- ordinalgmifs(group ~ MPO_E302_R, x = c("DDIT3_P1313_R", "HDAC9_P137_R"), 
	data = hccframe, epsilon = 0.01)
coef(hcc.fit)
summary(hcc.fit)
phat <- predict(hcc.fit)
head(phat$predicted)
table(phat$class, hccframe$group)



