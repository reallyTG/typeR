library(sensiPhy)


### Name: intra_phyglm
### Title: Intraspecific variability - Phylogenetic Logistic Regression
### Aliases: intra_phyglm

### ** Examples

# Simulate Data:
set.seed(6987)
phy = rtree(150)
x = rTrait(n=1,phy=phy)
x_sd = rnorm(150,mean = 0.8,sd=0.2)
X = cbind(rep(1,150),x)
y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
dat = data.frame(y, x, x_sd)

# Run phylogenetic logistic regression accounting for intraspecific variation:
intra_glm <- intra_phyglm(y~x,Vx = "x_sd",data = dat,phy=phy,distrib = "normal")

#Print summary of sensitivity analysis
summary(intra_glm)
head(intra_glm$sensi.estimates)
#Visual output
sensi_plot(intra_glm)



