library(lavaSearch2)


### Name: vcov2
### Title: Extract the Variance Covariance Matrix of the Model Parameters
### Aliases: vcov2 vcov2.lm vcov2.gls vcov2.lme vcov2.lvmfit vcov2.lm2
###   vcov2.gls2 vcov2.lme2 vcov2.lvmfit2

### ** Examples

n <- 5e1
p <- 3
X.name <- paste0("X",1:p)
link.lvm <- paste0("Y~",X.name)
formula.lvm <- as.formula(paste0("Y~",paste0(X.name,collapse="+")))

m <- lvm(formula.lvm)
distribution(m,~Id) <- sequence.lvm(0)
set.seed(10)
d <- lava::sim(m,n)

## linear model
e.lm <- lm(formula.lvm,data=d)
vcov.tempo <- vcov2(e.lm, bias.correct = TRUE)
vcov.tempo[rownames(vcov(e.lm)),colnames(vcov(e.lm))]/vcov(e.lm)

## latent variable model
e.lvm <- estimate(lvm(formula.lvm),data=d)
vcov.tempo <- vcov2(e.lvm, bias.correct = FALSE)
vcov.tempo/vcov(e.lvm)




