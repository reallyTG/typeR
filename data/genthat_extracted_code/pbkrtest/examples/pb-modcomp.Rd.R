library(pbkrtest)


### Name: pb-modcomp
### Title: Model comparison using parametric bootstrap methods.
### Aliases: PBmodcomp PBmodcomp.lm PBmodcomp.mer PBmodcomp.merMod getLRT
###   getLRT.lm getLRT.mer getLRT.merMod pb-modcomp plot.XXmodcomp
### Keywords: inference models

### ** Examples


data(beets, package="pbkrtest")
head(beets)

## Linear mixed effects model:
sug   <- lmer(sugpct ~ block + sow + harvest + (1|block:harvest), data=beets, REML=FALSE)
sug.h <- update(sug, .~. -harvest)
sug.s <- update(sug, .~. -sow)

anova(sug, sug.h)
PBmodcomp(sug, sug.h, nsim=50)
anova(sug, sug.h)
PBmodcomp(sug, sug.s, nsim=50)

## Linear normal model:
sug <- lm(sugpct ~ block + sow + harvest, data=beets)
sug.h <- update(sug, .~. -harvest)
sug.s <- update(sug, .~. -sow)

anova(sug, sug.h)
PBmodcomp(sug, sug.h, nsim=50)
anova(sug, sug.s)
PBmodcomp(sug, sug.s, nsim=50)

## Generalized linear model
counts    <- c(18,17,15,20,10,20,25,13,12)
outcome   <- gl(3,1,9)
treatment <- gl(3,3)
d.AD      <- data.frame(treatment, outcome, counts)
head(d.AD)
glm.D93   <- glm(counts ~ outcome + treatment, family = poisson())
glm.D93.o <- update(glm.D93, .~. -outcome)
glm.D93.t <- update(glm.D93, .~. -treatment)

anova(glm.D93, glm.D93.o, test="Chisq")
PBmodcomp(glm.D93, glm.D93.o, nsim=50)
anova(glm.D93, glm.D93.t, test="Chisq")
PBmodcomp(glm.D93, glm.D93.t, nsim=50)

## Generalized linear mixed model (it takes a while to fit these)
## Not run: 
##D (gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
##D               data = cbpp, family = binomial))
##D (gm2 <- update(gm1, .~.-period))
##D anova(gm1, gm2)
##D PBmodcomp(gm1, gm2)
## End(Not run)


## Not run: 
##D (fmLarge <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy))
##D ## removing Days
##D (fmSmall <- lmer(Reaction ~ 1 + (Days|Subject), sleepstudy))
##D anova(fmLarge, fmSmall)
##D PBmodcomp(fmLarge, fmSmall)
##D 
##D ## The same test using a restriction matrix
##D L <- cbind(0,1)
##D PBmodcomp(fmLarge, L)
##D 
##D ## Vanilla
##D PBmodcomp(beet0, beet_no.harv, nsim=1000)
##D 
##D ## Simulate reference distribution separately:
##D refdist <- PBrefdist(beet0, beet_no.harv, nsim=1000)
##D PBmodcomp(beet0, beet_no.harv, ref=refdist)
##D 
##D ## Do computations with multiple processors:
##D ## Number of cores:
##D (nc <- detectCores())
##D ## Create clusters
##D cl <- makeCluster(rep("localhost", nc))
##D 
##D ## Then do:
##D PBmodcomp(beet0, beet_no.harv, cl=cl)
##D 
##D ## Or in two steps:
##D refdist <- PBrefdist(beet0, beet_no.harv, nsim=1000, cl=cl)
##D PBmodcomp(beet0, beet_no.harv, ref=refdist)
##D 
##D ## It is recommended to stop the clusters before quitting R:
##D stopCluster(cl)
## End(Not run)





