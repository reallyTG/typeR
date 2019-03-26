library(metafor)


### Name: dat.senn2013
### Title: Studies on the Effectiveness of Glucose-Lowering Agents
### Aliases: dat.senn2013
### Keywords: datasets

### ** Examples

### load data
dat <- get(data(dat.senn2013))

### create network graph ('plyr' and 'igraph' packages must be installed)
## Not run: 
##D require(plyr)
##D require(igraph)
##D pairs <- do.call(rbind, sapply(split(dat$treatment, dat$study), function(x) t(combn(x,2))))
##D pairs <- ddply(data.frame(pairs), .(X1, X2), count)
##D g <- graph.edgelist(as.matrix(pairs[,1:2]), directed=FALSE)
##D plot(g, edge.curved=FALSE, edge.width=pairs$freq, vertex.label.dist=.8)
## End(Not run)

### table of studies versus treatments examined
print(addmargins(table(dat$study, dat$treatment)), zero.print="")

### table of frequencies with which treatment pairs were studied
print(as.table(crossprod(table(dat$study, dat$treatment))), zero.print="")

### add means and sampling variances of the means to the dataset
dat <- escalc(measure="MN", mi=mi, sdi=sdi, ni=ni, data=dat)

### turn treatment variable into factor and set reference level
dat$treatment <- relevel(factor(dat$treatment), ref="placebo")

### add a space before each level (this makes the output a bit more legible)
levels(dat$treatment) <- paste0(" ", levels(dat$treatment))

### network meta-analysis using an arm-based fixed-effects model with fixed study effects
res.fe <- rma.mv(yi, vi, mods = ~ study + treatment - 1, data=dat, slab=paste0(study, treatment))
res.fe

### test if treatment factor as a whole is significant
anova(res.fe, btt=(res.fe$p-8):res.fe$p)

### forest plot of the contrast estimates (treatments versus placebos)
dev.new(width=7, height=5)
forest(tail(coef(res.fe), 9), tail(diag(vcov(res.fe)), 9), slab=levels(dat$treatment)[-1],
       xlim=c(-2.5, 2.0), alim=c(-1.5, 0.5), psize=1, xlab="Estimate")
text(-2.5, 11, "Treatment", pos=4, font=2)
text( 2.0, 11, "Estimate [95% CI]", pos=2, font=2)

### weight matrix for the estimation of the fixed effects (leaving out study effects)
w <- t(tail(vcov(res.fe) %*% t(model.matrix(res.fe)) %*% weights(res.fe, type="matrix"), 9))
rownames(w) <- res.fe$slab

### create shade plot for the diabetes network with placebo as the reference treatment
### negative values in blue shades, positive values in red shades
dev.new()
cols <- colorRampPalette(c("blue", "gray95", "red"))(9)
heatmap(w, Rowv=NA, Colv=NA, scale="none", margins=c(6,11), col=cols,
        cexRow=.7, cexCol=1, labCol=levels(dat$treatment)[-1])

### network meta-analysis using an arm-based random-effects model with fixed study effects
### by setting rho=1/2, tau^2 reflects the amount of heterogeneity for all treatment comparisons
res.re <- rma.mv(yi, vi, mods = ~ study + treatment - 1, random = ~ treatment | study, rho=1/2,
                 data=dat, slab=paste0(study, treatment))

### test if treatment factor as a whole is significant
anova(res.re, btt=(res.re$p-8):res.re$p)

### forest plot of the contrast estimates (treatments versus placebos)
forest(tail(coef(res.re), 9), tail(diag(vcov(res.re)), 9), slab=levels(dat$treatment)[-1],
       xlim=c(-3.0, 2.5), alim=c(-1.5, 0.5), psize=1, xlab="Estimate")
text(-3.0, 11, "Treatment", pos=4, font=2)
text( 2.5, 11, "Estimate [95% CI]", pos=2, font=2)

### compute contribution of each study to the overall Q-test value
qi <- sort(by((resid(res.fe) / sqrt(dat$vi))^2, dat$study, sum))

### check that the values add up
sum(qi)
res.fe$QE

### plot the values
s <- length(qi)
par(mar=c(5,10,2,1))
plot(qi, 1:s, pch=19, xaxt="n", yaxt="n", xlim=c(0,40), xlab="Chi-Square Contribution", ylab="")
axis(side=1)
axis(side=2, at=1:s, labels=names(qi), las=1, tcl=0)
segments(rep(0,s), 1:s, qi, 1:s)

### restructure dataset to a contrast-based format
dat <- dat.senn2013[,c(1,4,3,2,5,6)]
dat.c <- lapply(split(dat, dat$study),
                function(x) cbind(x[rep(1,nrow(x)-1),], x[-1,c(3:6)]))
dat.c <- do.call(rbind, dat.c)
names(dat.c)[3:10] <- c("trt1", "n1i", "m1i", "sd1i", "trt2", "n2i", "m2i", "sd2i")
rownames(dat.c) <- 1:nrow(dat.c)
dat.c$id <- 1:nrow(dat.c)
dat.c

### calculate mean difference and corresponding sampling variance for each treatment comparison
dat.c <- escalc(measure="MD", m1i=m1i, sd1i=sd1i, n1i=n1i, m2i=m2i, sd2i=sd2i, n2i=n2i, data=dat.c)
dat.c

### calculate the variance-covariance matrix of the mean differences for the multitreatment studies
calc.v <- function(x) {
   v <- matrix(x$sd1i[1]^2 / x$n1i[1], nrow=nrow(x), ncol=nrow(x))
   diag(v) <- x$vi
   v
}
V <- bldiag(lapply(split(dat.c, dat.c$study), calc.v))

### convert trt1 and trt2 variables to factors and set levels
lvls <- levels(factor(dat$treatment))
dat.c$trt1 <- factor(dat.c$trt1, levels=lvls)
dat.c$trt2 <- factor(dat.c$trt2, levels=lvls)

### create variables to indicate the contrast examined
dat.c <- cbind(dat.c, model.matrix(~ dat.c$trt1 - 1) - model.matrix(~ dat.c$trt2 - 1))
names(dat.c)[(ncol(dat.c)-9):ncol(dat.c)] <- lvls

### network meta-analysis using a contrast-based random-effects model
### by setting rho=1/2, tau^2 reflects the amount of heterogeneity for all treatment comparisons
### the treatment left out (placebo) becomes the reference level for the treatment comparisons
res.cb <- rma.mv(yi, V, mods = ~ acarbose + benfluorex + metformin + miglitol + pioglitazone +
                                 rosiglitazone + sitagliptin + sulfonylurea + vildagliptin - 1,
                 random = ~ factor(id) | study, rho=1/2, data=dat.c)
res.cb

### estimate all pairwise differences between treatments (using the 'multcomp' package)
if (require(multcomp)) {
   contr <- contrMat(setNames(rep(1,res.cb$p), colnames(res.cb$X)), type="Tukey")
   sav <- predict(res.cb, newmods=contr)
   sav$slab <- rownames(contr)
   sav
}



