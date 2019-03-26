library(spdep)


### Name: ME
### Title: Moran eigenvector GLM filtering
### Aliases: ME print.ME_res fitted.ME_res
### Keywords: spatial

### ** Examples

## Not run: 
##D if (require(rgdal, quietly=TRUE)) {
##D example(columbus, package="spData")
##D lmbase <- lm(CRIME ~ INC + HOVAL, data=columbus)
##D lagcol <- SpatialFiltering(CRIME ~ 1, ~ INC + HOVAL, data=columbus,
##D  nb=col.gal.nb, style="W", alpha=0.1, verbose=TRUE)
##D lagcol
##D lmlag <- lm(CRIME ~ INC + HOVAL + fitted(lagcol), data=columbus)
##D anova(lmlag)
##D anova(lmbase, lmlag)
##D set.seed(123)
##D lagcol1 <- ME(CRIME ~ INC + HOVAL, data=columbus, family="gaussian",
##D  listw=nb2listw(col.gal.nb), alpha=0.1, verbose=TRUE)
##D lagcol1
##D lmlag1 <- lm(CRIME ~ INC + HOVAL + fitted(lagcol1), data=columbus)
##D anova(lmlag1)
##D anova(lmbase, lmlag1)
##D set.seed(123)
##D lagcol2 <- ME(CRIME ~ INC + HOVAL, data=columbus, family="gaussian",
##D  listw=nb2listw(col.gal.nb), alpha=0.1, stdev=TRUE, verbose=TRUE)
##D lagcol2
##D lmlag2 <- lm(CRIME ~ INC + HOVAL + fitted(lagcol2), data=columbus)
##D anova(lmlag2)
##D anova(lmbase, lmlag2)
##D example(nc.sids, package="spData")
##D glmbase <- glm(SID74 ~ 1, data=nc.sids, offset=log(BIR74),
##D  family="poisson")
##D set.seed(123)
##D MEpois1 <- ME(SID74 ~ 1, data=nc.sids, offset=log(BIR74),
##D  family="poisson", listw=nb2listw(ncCR85_nb, style="B"), alpha=0.2, verbose=TRUE)
##D MEpois1
##D glmME <- glm(SID74 ~ 1 + fitted(MEpois1), data=nc.sids, offset=log(BIR74),
##D  family="poisson")
##D anova(glmME, test="Chisq")
##D anova(glmbase, glmME, test="Chisq")
##D }
##D data(hopkins, package="spData")
##D hopkins_part <- hopkins[21:36,36:21]
##D hopkins_part[which(hopkins_part > 0, arr.ind=TRUE)] <- 1
##D hopkins.rook.nb <- cell2nb(16, 16, type="rook")
##D glmbase <- glm(c(hopkins_part) ~ 1, family="binomial")
##D set.seed(123)
##D MEbinom1 <- ME(c(hopkins_part) ~ 1, family="binomial",
##D  listw=nb2listw(hopkins.rook.nb, style="B"), alpha=0.2, verbose=TRUE)
##D glmME <- glm(c(hopkins_part) ~ 1 + fitted(MEbinom1), family="binomial")
##D anova(glmME, test="Chisq")
##D anova(glmbase, glmME, test="Chisq")
## End(Not run)



