library(lavaSearch2)


### Name: score2
### Title: Extract The Individual Score
### Aliases: score2 score2.lm score2.gls score2.lme score2.lvmfit
###   score2.lm2 score2.gls2 score2.lme2 score2.lvmfit2

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
score.tempo <- score2(e.lm, bias.correct = FALSE)
colMeans(score.tempo)

## latent variable model
e.lvm <- estimate(lvm(formula.lvm),data=d)
score.tempo <- score2(e.lvm, bias.correct = FALSE)
range(score.tempo-score(e.lvm, indiv = TRUE))




