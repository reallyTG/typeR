library(heplots)


### Name: Skulls
### Title: Egyptian Skulls
### Aliases: Skulls
### Keywords: datasets

### ** Examples

data(Skulls)
# make shorter labels for epochs
Skulls$epoch <- factor(Skulls$epoch, labels=sub("c","",levels(Skulls$epoch)))
# variable labels
vlab <- c("maxBreadth", "basibHeight", "basialLength", "nasalHeight")

# fit manova model
sk.mod <- lm(cbind(mb, bh, bl, nh) ~ epoch, data=Skulls)

Manova(sk.mod)
summary(Manova(sk.mod))

# test trends over epochs
linearHypothesis(sk.mod, "epoch.L") # linear component
linearHypothesis(sk.mod, "epoch.Q") # quadratic component

# typical scatterplots are not very informative
scatterplot(mb ~ bh|epoch, data=Skulls, 
            ellipse=TRUE, levels=0.68, smooth=FALSE, legend.coords="topright")
scatterplot(mb ~ bl|epoch, data=Skulls, 
            ellipse=TRUE, levels=0.68, smooth=FALSE, legend.coords="topright")

# HE plots

heplot(sk.mod, hypotheses=list(Lin="epoch.L", Quad="epoch.Q"), xlab=vlab[1], ylab=vlab[2])
pairs(sk.mod, hypotheses=list(Lin="epoch.L", Quad="epoch.Q"), var.labels=vlab)

# 3D plot shows that nearly all of hypothesis variation is linear!
## Not run: 
##D heplot3d(sk.mod, hypotheses=list(Lin="epoch.L", Quad="epoch.Q"), col=c("pink", "blue"))
##D 
##D # view in canonical space
##D if (require(candisc)) {
##D 	sk.can <- candisc(sk.mod)
##D 	sk.can
##D 	heplot(sk.can)
##D 	heplot3d(sk.can)
##D }
## End(Not run)




