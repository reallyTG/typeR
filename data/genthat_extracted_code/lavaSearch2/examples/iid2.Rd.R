library(lavaSearch2)


### Name: iid2
### Title: Extract corrected i.i.d. decomposition
### Aliases: iid2 iid2.lm iid2.gls iid2.lme iid2.lvmfit iid2.lm2 iid2.gls2
###   iid2.lme2 iid2.lvmfit2

### ** Examples

n <- 5e1
p <- 3
X.name <- paste0("X",1:p)
link.lvm <- paste0("Y~",X.name)
formula.lvm <- as.formula(paste0("Y~",paste0(X.name,collapse="+")))

m <- lvm(formula.lvm)
distribution(m,~Id) <- sequence.lvm(0)
set.seed(10)
d <- sim(m,n)

## linear model
e.lm <- lm(formula.lvm,data=d)
iid.tempo <- iid2(e.lm, bias.correct = FALSE)
range(iid.tempo[,1:4]-iid(e.lm))

## latent variable model
e.lvm <- estimate(lvm(formula.lvm),data=d)
iid.tempo <- iid2(e.lvm, bias.correct = FALSE)
range(iid.tempo-iid(e.lvm))
## difference due to the use of the observed info matrix vs. the expected one.

## rescale i.i.d using model-based standard error
iid.tempo <- iid2(e.lvm, robust = FALSE, bias.correct = FALSE)
diag(crossprod(iid.tempo))-diag(vcov(e.lvm))




