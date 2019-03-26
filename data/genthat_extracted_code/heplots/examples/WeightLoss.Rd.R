library(heplots)


### Name: WeightLoss
### Title: Weight Loss Data
### Aliases: WeightLoss
### Keywords: datasets

### ** Examples

data(WeightLoss)
str(WeightLoss)
table(WeightLoss$group)

contrasts(WeightLoss$group) <- matrix(c(-2,1,1, 0, -1, 1),ncol=2)
(wl.mod<-lm(cbind(wl1,wl2,wl3,se1,se2,se3)~group, data=WeightLoss))

heplot(wl.mod, hypotheses=c("group1", "group2"))
pairs(wl.mod, variables=1:3)
pairs(wl.mod, variables=4:6)

# within-S variables
within <- data.frame(measure=rep(c("Weight loss", "Self esteem"),each=3), month=rep(ordered(1:3),2))

# doubly-multivariate analysis: requires car 2.0+
## Not run: 
##D if (packageDescription("car")[["Version"]] >= 2) {
##D imatrix <- matrix(c(
##D 	1,0,-1, 1, 0, 0,
##D 	1,0, 0,-2, 0, 0,
##D 	1,0, 1, 1, 0, 0,
##D 	0,1, 0, 0,-1, 1,
##D 	0,1, 0, 0, 0,-2,
##D 	0,1, 0, 0, 1, 1), 6, 6, byrow=TRUE)
##D # NB: for heplots the columns of imatrix should have names
##D colnames(imatrix) <- c("WL", "SE", "WL.L", "WL.Q", "SE.L", "SE.Q")
##D rownames(imatrix) <- colnames(WeightLoss)[-1]
##D (imatrix <- list(measure=imatrix[,1:2], month=imatrix[,3:6]))
##D contrasts(WeightLoss$group) <- matrix(c(-2,1,1, 0,-1,1), ncol=2) 
##D (wl.mod<-lm(cbind(wl1, wl2, wl3, se1, se2, se3)~group, data=WeightLoss))
##D (wl.aov <- Anova(wl.mod, imatrix=imatrix, test="Roy"))
##D 
##D heplot(wl.mod, imatrix=imatrix, iterm="group:measure")
##D }
## End(Not run)

# do the correct analysis 'manually'
unit <- function(n, prefix="") {
	J <-matrix(rep(1, n), ncol=1)
	rownames(J) <- paste(prefix, 1:n, sep="")
	J
}                

measure <- kronecker(diag(2), unit(3, 'M')/3, make.dimnames=TRUE)
colnames(measure)<- c('WL', 'SE')

between <- as.matrix(WeightLoss[,-1]) 

between.mod <- lm(between ~ group, data=WeightLoss)
Anova(between.mod)

heplot(between.mod, hypotheses=c("group1", "group2"), 
	xlab="Weight Loss", ylab="Self Esteem",
	col=c("red", "blue", "brown"),
	main="Weight Loss & Self Esteem: Group Effect")

month <- kronecker(diag(2), poly(1:3), make.dimnames=TRUE)
colnames(month)<- c('WL', 'SE')
trends <- as.matrix(WeightLoss[,-1]) 
within.mod <- lm(trends ~ group, data=WeightLoss)
Anova(within.mod)

heplot(within.mod)
heplot(within.mod, hypotheses=c("group1", "group2"), 
	xlab="Weight Loss", ylab="Self Esteem",
	type="III", remove.intercept=FALSE,
	term.labels=c("month", "group:month"),
	main="Weight Loss & Self Esteem: Within-S Effects")
mark.H0()



