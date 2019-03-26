library(agridat)


### Name: lehner.soybeanmold
### Title: Yield, white mold, and sclerotia for soybeans in Brazil
### Aliases: lehner.soybeanmold
### Keywords: datasets

### ** Examples

data(lehner.soybeanmold)
dat <- lehner.soybeanmold

## Not run: 
##D   op <- par(mfrow=c(2,2))
##D   hist(dat$mold, main="White mold incidence")
##D   hist(dat$yield, main="Yield")
##D   hist(dat$sclerotia, main="Sclerotia weight")
##D   par(op)
## End(Not run)

require(lattice)
xyplot(yield ~ mold|study, dat, type=c('p','r'),
       main="lehner.soybeanmold")
# xyplot(sclerotia ~ mold|study, dat, type=c('p','r'))

# Example meta-analysis. Could use metafor package to construct the forest
# plot, but it is easier with lattice and ggplot is slow/clumsy
if(require(latticeExtra) & require(metafor)){
  # calculate correlation & confidence for each loc
  cors <- split(dat, dat$study)
  cors <- sapply(cors,
                 FUN=function(X){
                   res <- cor.test(X$yield, X$mold)
                   c(res$estimate, res$parameter[1],
                     conf.low=res$conf.int[1], conf.high=res$conf.int[2])
                 })
  cors <- as.data.frame(t(as.matrix(cors)))
  cors$study <- rownames(cors)
  # Fisher Z transform
  cors <- transform(cors, ri = cor)
  cors <- transform(cors, ni = df + 2)
  cors <- transform(cors,
                    yi = 1/2 * log((1 + ri)/(1 - ri)),
                    vi = 1/(ni - 3))
  # Overall correlation across studies
  overall <- rma.uni(yi, vi, method="ML", data=cors) # metafor package
  # back transform
  overall <- predict(overall, transf=transf.ztor)

  # weight and size for forest plot
  wi    <- 1/sqrt(cors$vi)
  size  <- 0.5 + 3.0 * (wi - min(wi))/(max(wi) - min(wi))

  # now the forest plot
  # must use latticeExtra::layer in case ggplot2 is also loaded
  segplot(factor(study) ~ conf.low+conf.high, data=cors,
          draw.bands=FALSE, level=size, centers=ri, cex=size,
          col.regions=colorRampPalette(c("gray85", "dodgerblue4")),
          main="White mold vs. soybean yield",
          xlab=paste("Study correlation, confidence, and study weight (blues)\n",
                     "Overall (black)"),
          ylab="Study ID") +
    latticeExtra::layer(panel.abline(v=overall$pred, lwd=2)) +
    latticeExtra::layer(panel.abline(v=c(overall$cr.lb, overall$cr.ub), lty=2, col="gray"))

}

# Meta-analyses are typically used when the original data is not available.
# Since the original data is available, a mixed model is probably better.
## Not run: 
##D   library(lme4)
##D   m1 <- lmer(yield ~ mold # overall slope
##D              + (1+mold |study), # random intercept & slope per study
##D              data=dat)
##D   summary(m1)
## End(Not run)



