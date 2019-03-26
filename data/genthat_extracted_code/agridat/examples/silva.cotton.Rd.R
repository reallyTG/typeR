library(agridat)


### Name: silva.cotton
### Title: Number of cotton bolls for different levels of defoliation.
### Aliases: silva.cotton
### Keywords: datasets

### ** Examples


data(silva.cotton)
dat <- silva.cotton
dat$stage <- ordered(dat$stage,
                     levels=c("vegetative","flowerbud","blossom","boll","bollopen"))
# make stage a numeric factors
dat <- transform(dat,
                 stage = factor(stage, levels = unique(stage),
                                labels = 1:nlevels(stage)))

# sum data across plants, 1 pot = 2 plants
dat <- aggregate(cbind(weight,height,bolls,nodes) ~
                    stage+defoliation+rep, data=dat, FUN=sum)

# all traits, plant-level data
if(require(latticeExtra)){
  foo <- xyplot(weight + height + bolls + nodes ~ defoliation | stage,
                data = dat, outer=TRUE,
                xlab="Defoliation percent", ylab="", main="silva.cotton",
                as.table = TRUE, jitter.x = TRUE, type = c("p", "smooth"),
                scales = list(y = "free"))
  combineLimits(useOuterStrips(foo))
}

## Not run: 
##D 
##D   # poisson glm with quadratic effect for defoliation
##D   m0 <- glm(bolls ~ 1, data=dat, family=poisson)
##D   m1 <- glm(bolls ~ defoliation+I(defoliation^2), data=dat, family=poisson)
##D   m2 <- glm(bolls ~ stage:defoliation+I(defoliation^2), data=dat, family=poisson)
##D   m3 <- glm(bolls ~ stage:(defoliation+I(defoliation^2)), data=dat, family=poisson)
##D   par(mfrow=c(2,2)); plot(m3); layout(1)
##D   anova(m0, m1, m2, m3, test="Chisq")
##D 
##D   # predicted values
##D   preddat <- expand.grid(stage=levels(dat$stage),
##D                          defoliation=seq(0,100,length=20))
##D   preddat$pred <- predict(m3, newdata=preddat, type="response")
##D 
##D   # Zeviani figure 3
##D   require(latticeExtra)
##D   xyplot(bolls ~ jitter(defoliation)|stage, dat,
##D          as.table=TRUE,
##D          main="silva.cotton - observed and model predictions",
##D          xlab="Defoliation percent",
##D          ylab="Number of bolls") +
##D     xyplot(pred ~ defoliation|stage, data=preddat,
##D            as.table=TRUE,
##D            type='smooth', col="black", lwd=2)
## End(Not run)

## Not run: 
##D   # ----- mcglm -----
##D   dat <- transform(dat, deffac=factor(defoliation))
##D 
##D   library(car)
##D 
##D   vars <- c("weight","height","bolls","nodes")
##D   splom(~dat[vars], data=dat,
##D         groups = stage,
##D         auto.key = list(title = "Growth stage",
##D                         cex.title = 1,
##D                         columns = 3),
##D         par.settings = list(superpose.symbol = list(pch = 4)),
##D         as.matrix = TRUE)
##D 
##D   splom(~dat[vars], data=dat,
##D         groups = defoliation,
##D         auto.key = list(title = "Artificial defoliation",
##D                         cex.title = 1,
##D                         columns = 3),
##D         as.matrix = TRUE)
##D 
##D   # multivariate linear model.
##D   m1 <- lm(cbind(weight, height, bolls, nodes) ~ stage * deffac,
##D            data = dat)
##D   anova(m1)
##D 
##D   summary.aov(m1)
##D 
##D   r0 <- residuals(m1)
##D 
##D   # Checking the models assumptions on the residuals.
##D   car::scatterplotMatrix(r0,
##D                          gap = 0, smooth = FALSE, reg.line = FALSE, ellipse = TRUE,
##D                          diagonal = "qqplot")
##D 
##D   
## End(Not run)



