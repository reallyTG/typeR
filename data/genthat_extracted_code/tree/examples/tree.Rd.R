library(tree)


### Name: tree
### Title: Fit a Classification or Regression Tree
### Aliases: tree print.tree summary.tree print.summary.tree residuals.tree
### Keywords: tree

### ** Examples

data(cpus, package="MASS")
cpus.ltr <- tree(log10(perf) ~ syct+mmin+mmax+cach+chmin+chmax, cpus)
cpus.ltr
summary(cpus.ltr)
plot(cpus.ltr);  text(cpus.ltr)

ir.tr <- tree(Species ~., iris)
ir.tr
summary(ir.tr)
## Don't show: 
## tests of singlenode tree
set.seed(1)
Nvars <- 4;
Nsamples <- 5
N <- Nvars*Nsamples;
dat <- matrix(sample(1:2, N, c(0.5,0.5), replace=TRUE), Nsamples, Nvars)
dat <- as.data.frame(dat)
for (i in 1:Nvars) {
   dat[,i]<- factor(dat[,i], 1:2)
}
names(dat) <- c(paste("X", 1:3, sep=""), "Y")
tr <- tree(Y ~ ., dat)
tr
summary(tr)
deviance(tr)
residuals(tr)
## End(Don't show)


