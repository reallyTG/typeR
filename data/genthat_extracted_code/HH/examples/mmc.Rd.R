library(HH)


### Name: mmc
### Title: MMC (Mean-mean Multiple Comparisons) plots.
### Aliases: mmc MMC multicomp multicomp.mmc mmc mmc.glht mmc.default
###   [.mmc.multicomp
### Keywords: hplot htest design

### ** Examples

## Use mmc with R.
## Use multicomp.mmc with S-Plus.

## data and ANOVA
## catalystm example
data(catalystm)

bwplot(concent ~ catalyst, data=catalystm,
       scales=list(cex=1.5),
       ylab=list("concentration", cex=1.5),
       xlab=list("catalyst",cex=1.5))


catalystm1.aov <- aov(concent ~ catalyst, data=catalystm)
summary(catalystm1.aov)

catalystm.mca <-
glht(catalystm1.aov, linfct = mcp(catalyst = "Tukey"))
confint(catalystm.mca)
plot(catalystm.mca)                      ## multcomp plot
mmcplot(catalystm.mca, focus="catalyst") ## HH plot

## pairwise comparisons
catalystm.mmc <-
  mmc(catalystm1.aov, focus="catalyst")
catalystm.mmc

## Not run: 
##D ## these three statements are identical for a one-way aov
##D   mmc(catalystm1.aov)  ## simplest
##D   mmc(catalystm1.aov, focus="catalyst") ## generalizes to higher-order designs
##D   mmc(catalystm1.aov, linfct = mcp(catalyst = "Tukey")) ## glht arguments
## End(Not run)

mmcplot(catalystm.mmc, style="both")


## User-Specified Contrasts
## Row names must include all levels of the factor.
## Column names are the names the user assigns to the contrasts.
## Each column must sum to zero.
catalystm.lmat <- cbind("AB-D" =c( 1, 1, 0,-2),
                        "A-B"  =c( 1,-1, 0, 0),
                        "ABD-C"=c( 1, 1,-3, 1))
dimnames(catalystm.lmat)[[1]] <- levels(catalystm$catalyst)
catalystm.lmat

catalystm.mmc <-
mmc(catalystm1.aov,
       linfct = mcp(catalyst = "Tukey"),
       focus.lmat=catalystm.lmat)
catalystm.mmc

mmcplot(catalystm.mmc, style="both", type="lmat")


## Not run: 
##D ## Dunnett's test
##D ## weightloss example
##D data(weightloss)
##D bwplot(loss ~ group, data=weightloss,
##D        scales=list(cex=1.5),
##D        ylab=list("Weight Loss", cex=1.5),
##D        xlab=list("group",cex=1.5))
##D 
##D weightloss.aov <- aov(loss ~ group, data=weightloss)
##D summary(weightloss.aov)
##D 
##D group.count <- table(weightloss$group)
##D 
##D tmp.dunnett <-
##D   glht(weightloss.aov,
##D        linfct=mcp(group=contrMat(group.count, base=4)),
##D        alternative="greater")
##D mmcplot(tmp.dunnett, main="contrasts in alphabetical order", focus="group")
##D 
##D tmp.dunnett.mmc <-
##D   mmc(weightloss.aov,
##D       linfct=mcp(group=contrMat(group.count, base=4)),
##D       alternative="greater")
##D mmcplot(tmp.dunnett.mmc,
##D         main="contrasts ordered by average value of the means\nof the two levels in the contrasts")
##D 
##D tmp.dunnett.mmc
## End(Not run)

## Not run: 
##D ## two-way ANOVA
##D ## display example
##D 
##D data(display)
##D 
##D interaction2wt(time ~ emergenc * panel.ordered, data=display)
##D 
##D displayf.aov <- aov(time ~ emergenc * panel, data=display)
##D anova(displayf.aov)
##D 
##D ## multiple comparisons
##D ## MMC plot
##D displayf.mmc <- mmc(displayf.aov, focus="panel")
##D displayf.mmc
##D 
##D ## same thing using glht argument list
##D displayf.mmc <-
##D   mmc(displayf.aov,
##D       linfct=mcp(panel="Tukey", `interaction_average`=TRUE, `covariate_average`=TRUE))
##D 
##D mmcplot(displayf.mmc)
##D 
##D 
##D panel.lmat <- cbind("3-12"=c(-1,-1,2),
##D                     "1-2"=c( 1,-1,0))
##D dimnames(panel.lmat)[[1]] <- levels(display$panel)
##D panel.lmat
##D 
##D displayf.mmc <-
##D   mmc(displayf.aov, focus="panel", focus.lmat=panel.lmat)
##D 
##D ## same thing using glht argument list
##D displayf.mmc <-
##D   mmc(displayf.aov,
##D       linfct=mcp(panel="Tukey", `interaction_average`=TRUE, `covariate_average`=TRUE),
##D       focus.lmat=panel.lmat)
##D 
##D mmcplot(displayf.mmc, type="lmat")
## End(Not run)

## Not run: 
##D ## split plot design with tiebreaker plot
##D ##
##D ## This example is based on the query by Tomas Goicoa to R-news
##D ## http://article.gmane.org/gmane.comp.lang.r.general/76275/match=goicoa
##D ## It is a split plot similar to the one in HH Section 14.2 based on
##D ## Yates 1937 example.  I am using the Goicoa example here because its
##D ## MMC plot requires a tiebreaker plot.
##D 
##D 
##D data(maiz)
##D 
##D interaction2wt(yield ~ hibrido+nitrogeno+bloque, data=maiz,
##D                par.strip.text=list(cex=.7))
##D interaction2wt(yield ~ hibrido+nitrogeno, data=maiz)
##D 
##D maiz.aov <- aov(yield ~ nitrogeno*hibrido + Error(bloque/nitrogeno), data=maiz)
##D 
##D summary(maiz.aov)
##D summary(maiz.aov,
##D         split=list(hibrido=list(P3732=1, Mol17=2, A632=3, LH74=4)))
##D 
##D try(glht(maiz.aov, linfct=mcp(hibrido="Tukey")))  ## can't use 'aovlist' objects in glht
##D 
##D ## R glht() requires aov, not aovlist
##D maiz2.aov <- aov(terms(yield ~ bloque*nitrogeno + hibrido/nitrogeno,
##D                        keep.order=TRUE),
##D                  data=maiz)
##D summary(maiz2.aov)
##D 
##D ## There are many ties in the group means.
##D ## These are easily seen in the MMC plot, where the two clusters
##D ## c("P3747", "P3732", "LH74") and c("Mol17", "A632")
##D ## are evident from the top three contrasts including zero and the
##D ## bottom contrast including zero.  The significant contrasts are the
##D ## ones comparing hybrids in the top group of three to ones in the
##D ## bottom group of two.
##D 
##D ## We have two graphical responses to the ties.
##D ## 1. We constructed the tiebreaker plot.
##D ## 2. We construct a set of orthogonal contrasts to illustrate
##D ##    the clusters.
##D 
##D ## pairwise contrasts with tiebreakers.
##D maiz2.mmc <- mmc(maiz2.aov,
##D                  linfct=mcp(hibrido="Tukey", interaction_average=TRUE))
##D mmcplot(maiz2.mmc, style="both")  ## MMC and Tiebreaker
##D 
##D 
##D ## orthogonal contrasts
##D ## user-specified contrasts
##D hibrido.lmat <- cbind("PPL-MA" =c(2, 2,-3,-3, 2),
##D                       "PP-L"   =c(1, 1, 0, 0,-2),
##D                       "P47-P32"=c(1,-1, 0, 0, 0),
##D                       "M-A"    =c(0, 0, 1,-1, 0))
##D dimnames(hibrido.lmat)[[1]] <- levels(maiz$hibrido)
##D hibrido.lmat
##D 
##D maiz2.mmc <-
##D   mmc(maiz2.aov, focus="hibrido", focus.lmat=hibrido.lmat)
##D maiz2.mmc
##D 
##D ## same thing using glht argument list
##D maiz2.mmc <-
##D   mmc(maiz2.aov, linfct=mcp(hibrido="Tukey",
##D       `interaction_average`=TRUE), focus.lmat=hibrido.lmat)
##D 
##D   mmcplot(maiz2.mmc, style="both", type="lmat")
## End(Not run)



