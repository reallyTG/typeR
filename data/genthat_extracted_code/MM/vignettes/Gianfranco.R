### R code from vignette source 'Gianfranco.Rnw'

###################################################
### code chunk number 1: intro
###################################################
options("show.signif.stars" = FALSE)
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: setstuff
###################################################
options('digits'=5)


###################################################
### code chunk number 3: startup
###################################################
library("MM")
pm1 <- paras(5,pnames=letters[1:5])
theta(pm1) <- 2
pm1


###################################################
### code chunk number 4: randomsample
###################################################
set.seed(0)
(sample1 <- rMM(n=10, Y=20, paras=pm1))


###################################################
### code chunk number 5: sample.multinomial
###################################################
pm2 <- pm1
theta(pm2) <- 1 # revert to classical multinomial
(sample2 <- rMM(n=10, Y=20, paras=pm2))


###################################################
### code chunk number 6: lrtest
###################################################
support1 <- MM_allsamesum(sample1, paras=pm1)
support2 <- MM_allsamesum(sample1, paras=pm2)


###################################################
### code chunk number 7: printsupporttest
###################################################
support1-support2


###################################################
### code chunk number 8: voting
###################################################
data("voting")
cbind(voting,voting_tally)


###################################################
### code chunk number 9: change_to_a_dataframe
###################################################
Off <- -rowSums(lfactorial(voting))
jj <- glm(voting_tally~-1+(.)+offset(Off),data=as.data.frame(voting),family=poisson)


###################################################
### code chunk number 10: lindsey_pol
###################################################
Off <- -rowSums(lfactorial(voting))
summary(glm(voting_tally~-1+(.)+offset(Off),
data=as.data.frame(voting),family=poisson))


###################################################
### code chunk number 11: use_lindsey_voting
###################################################
Lindsey(voting, voting_tally, give_fit = TRUE)


###################################################
### code chunk number 12: lindsey_fit
###################################################
jjvoting <- Lindsey(voting, voting_tally, give=TRUE)
p.fit <- jjvoting$fit$coefficients[1:3]
p.mle <- p(jjvoting$MLE)


###################################################
### code chunk number 13: voting
###################################################
data("wilson")
head(non_met)


###################################################
### code chunk number 14: gunter_wilson
###################################################
wilson <- gunter(non_met)
wilson


###################################################
### code chunk number 15: change_to_a_dataframe
###################################################
wilson$tbl <- as.data.frame(wilson$tbl)
Off <- -rowSums(lfactorial(wilson$tbl))
jj <- glm(wilson$d~-1+(.)+offset(Off),data=wilson$tbl,family=poisson)


###################################################
### code chunk number 16: lindsey_wilson
###################################################
attach(wilson)
Off <- -rowSums(lfactorial(tbl))
summary(glm(d~-1+(.)+offset(Off),data=tbl,family=poisson))


###################################################
### code chunk number 17: detachwilson
###################################################
detach(wilson) 


###################################################
### code chunk number 18: use_lindsey_wilson
###################################################
Lindsey(wilson,give_fit=TRUE)


###################################################
### code chunk number 19: showobservedsuffstats
###################################################
summary(suffstats(wilson))


###################################################
### code chunk number 20: showexpectedsuffstats
###################################################
L <- Lindsey(wilson)


###################################################
### code chunk number 21: Gianfranco.Rnw:771-772
###################################################
expected_suffstats(L,5)


###################################################
### code chunk number 22: pollen_shower
###################################################
data("pollen")
pollen <- as.data.frame(pollen)
head(pollen)


###################################################
### code chunk number 23: usepartitions
###################################################
S(rep(100,4),100)


###################################################
### code chunk number 24: setdigits
###################################################
options('digits'=3)


###################################################
### code chunk number 25: find_p_hat
###################################################
p.hat <- colSums(pollen)/sum(pollen)


###################################################
### code chunk number 26: find_pollen_variances
###################################################
apply(pollen,2,var)


###################################################
### code chunk number 27: find_multinomial_variances
###################################################
100*p.hat*(1-p.hat)


###################################################
### code chunk number 28: calculate_sample_correlation_matrix
###################################################
cor(pollen)


###################################################
### code chunk number 29: corr_multinomial
###################################################
jj <- -outer(p.hat,p.hat)/sqrt(outer(p.hat,1-p.hat)*outer(1-p.hat,p.hat))
diag(jj) <- 1
jj


###################################################
### code chunk number 30: fullvariance
###################################################
var(pollen)


###################################################
### code chunk number 31: calculate_gunter
###################################################
jj <- gunter(pollen)
n <- jj$d
y <- jj$tbl
nm <- colnames(pollen)
lind_poll <- Lindsey(pollen, give_fit=TRUE)
fvm <-  lind_poll$fit$fitted.values/nrow(pollen)


###################################################
### code chunk number 32: plotter
###################################################
par(mfrow=c(2,2))
par(mai=c(0.2,0.2,0.2,0.2)*2)
f <- function(yin,xlimits,ylimits,pine){
  mfm <- tapply(fvm,yin,sum)
  p1 <- sum(n*yin)/sum(100*n)
  i <- 0:100
  fvb <- dbinom(i, 100,p1)
  matplot(i, cbind(fvb, mfm),
          xlab="",ylab="probability",
          main=pine,
          type="b", pch=16, xlim=xlimits, ylim=ylimits)
}

f(y[,1],c(70,100),c(0,0.12),nm[1])
f(y[,2],c( 0, 10),c(0,0.35),nm[2])
legend("topright",lty=1:2,pch=16,col=1:2,legend=c('multinomial','MM'))
f(y[,3],c( 0, 20),c(0,0.14),nm[3])
f(y[,4],c( 0, 10),c(0,0.25),nm[4])


###################################################
### code chunk number 33: print_lindsey_pollen
###################################################
lind_poll


###################################################
### code chunk number 34: datadan
###################################################
data("danaher")
danaher


###################################################
### code chunk number 35: fishertest
###################################################
set.seed(1)
jjfish <- fisher.test(as.array(danaher), sim=TRUE,B=1e6)
jjv <- round(jjfish$p.value*1e6,3)


###################################################
### code chunk number 36: danaher.bacon.eggs
###################################################
fit <- Lindsey_MB(danaher)
summary(fit)


###################################################
### code chunk number 37: asdf
###################################################
jj <- coefficients(fit)[6]


###################################################
### code chunk number 38: remove_n
###################################################
rm(n)


###################################################
### code chunk number 39: define_N
###################################################
N <- sum(danaher)


###################################################
### code chunk number 40: test2
###################################################
M <- danaher
M[] <- fitted.values(fit)
M


###################################################
### code chunk number 41: Gianfranco.Rnw:1022-1024
###################################################
bacon <- slice.index(danaher,1)
eggs  <- slice.index(danaher,2)


###################################################
### code chunk number 42: Gianfranco.Rnw:1025-1027
###################################################
sum(bacon*danaher)         # Observed number of bacon purchases
sum(bacon*M)               # Expectation;  matches


###################################################
### code chunk number 43: correlation
###################################################
sum(bacon*eggs*danaher)/N - sum(bacon*danaher)*sum(eggs*danaher)/N^2
sum(bacon*eggs*M)      /N - sum(bacon*M      )*sum(eggs*M      )/N^2


