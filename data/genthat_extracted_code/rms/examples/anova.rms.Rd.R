library(rms)


### Name: anova.rms
### Title: Analysis of Variance (Wald and F Statistics)
### Aliases: anova.rms print.anova.rms plot.anova.rms latex.anova.rms
###   html.anova.rms
### Keywords: models regression htest aplot

### ** Examples

n <- 1000    # define sample size
set.seed(17) # so can reproduce the results
treat <- factor(sample(c('a','b','c'), n,TRUE))
num.diseases <- sample(0:4, n,TRUE)
age <- rnorm(n, 50, 10)
cholesterol <- rnorm(n, 200, 25)
weight <- rnorm(n, 150, 20)
sex <- factor(sample(c('female','male'), n,TRUE))
label(age) <- 'Age'      # label is in Hmisc
label(num.diseases) <- 'Number of Comorbid Diseases'
label(cholesterol) <- 'Total Cholesterol'
label(weight) <- 'Weight, lbs.'
label(sex) <- 'Sex'
units(cholesterol) <- 'mg/dl'   # uses units.default in Hmisc


# Specify population model for log odds that Y=1
L <- .1*(num.diseases-2) + .045*(age-50) +
     (log(cholesterol - 10)-5.2)*(-2*(treat=='a') +
     3.5*(treat=='b')+2*(treat=='c'))
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
y <- ifelse(runif(n) < plogis(L), 1, 0)


fit <- lrm(y ~ treat + scored(num.diseases) + rcs(age) +
               log(cholesterol+10) + treat:log(cholesterol+10))
a <- anova(fit)                       # Test all factors
b <- anova(fit, treat, cholesterol)   # Test these 2 by themselves
                                      # to get their pooled effects
a
b
# Add a new line to the plot with combined effects
s <- rbind(a, 'treat+cholesterol'=b['TOTAL',])
class(s) <- 'anova.rms'
plot(s, margin=c('chisq', 'proportion chisq'))

g <- lrm(y ~ treat*rcs(age))
dd <- datadist(treat, num.diseases, age, cholesterol)
options(datadist='dd')
p <- Predict(g, age, treat="b")
s <- anova(g)
# Usually omit fontfamily to default to 'Courier'
# It's specified here to make R pass its package-building checks
plot(p, addpanel=pantext(s, 28, 1.9,  fontfamily='Helvetica'))

plot(s, margin=c('chisq', 'proportion chisq'))
# new plot - dot chart of chisq-d.f. with 2 other stats in right margin
# latex(s)                       # nice printout - creates anova.g.tex
options(datadist=NULL)


# Simulate data with from a given model, and display exactly which
# hypotheses are being tested


set.seed(123)
age <- rnorm(500, 50, 15)
treat <- factor(sample(c('a','b','c'), 500, TRUE))
bp  <- rnorm(500, 120, 10)
y   <- ifelse(treat=='a', (age-50)*.05, abs(age-50)*.08) + 3*(treat=='c') +
       pmax(bp, 100)*.09 + rnorm(500)
f   <- ols(y ~ treat*lsp(age,50) + rcs(bp,4))
print(names(coef(f)), quote=FALSE)
specs(f)
anova(f)
an <- anova(f)
options(digits=3)
print(an, 'subscripts')
print(an, 'dots')


an <- anova(f, test='Chisq', ss=FALSE)
plot(0:1)                        # make some plot
tab <- pantext(an, 1.2, .6, lattice=FALSE, fontfamily='Helvetica')
# create function to write table; usually omit fontfamily
tab()                            # execute it; could do tab(cex=.65)
plot(an)                         # new plot - dot chart of chisq-d.f.
# Specify plot(an, trans=sqrt) to use a square root scale for this plot
# latex(an)                      # nice printout - creates anova.f.tex


## Example to save partial R^2 for all predictors, along with overall
## R^2, from two separate fits, and to combine them with a lattice plot

require(lattice)
set.seed(1)
n <- 100
x1 <- runif(n)
x2 <- runif(n)
y  <- (x1-.5)^2 + x2 + runif(n)
group <- c(rep('a', n/2), rep('b', n/2))
A <- NULL
for(g in c('a','b')) {
    f <- ols(y ~ pol(x1,2) + pol(x2,2) + pol(x1,2) %ia% pol(x2,2),
             subset=group==g)
    a <- plot(anova(f),
              what='partial R2', pl=FALSE, rm.totals=FALSE, sort='none')
    a <- a[-grep('NONLINEAR', names(a))]
    d <- data.frame(group=g, Variable=factor(names(a), names(a)),
                    partialR2=unname(a))
    A <- rbind(A, d)
  }
dotplot(Variable ~ partialR2 | group, data=A,
        xlab=ex <- expression(partial~R^2))
dotplot(group ~ partialR2 | Variable, data=A, xlab=ex)
dotplot(Variable ~ partialR2, groups=group, data=A, xlab=ex,
        auto.key=list(corner=c(.5,.5)))


# Suppose that a researcher wants to make a big deal about a variable 
# because it has the highest adjusted chi-square.  We use the
# bootstrap to derive 0.95 confidence intervals for the ranks of all
# the effects in the model.  We use the plot method for anova, with
# pl=FALSE to suppress actual plotting of chi-square - d.f. for each
# bootstrap repetition.  
# It is important to tell plot.anova.rms not to sort the results, or
# every bootstrap replication would have ranks of 1,2,3,... for the stats.

n <- 300
set.seed(1)
d <- data.frame(x1=runif(n), x2=runif(n),  x3=runif(n),
   x4=runif(n), x5=runif(n), x6=runif(n),  x7=runif(n),
   x8=runif(n), x9=runif(n), x10=runif(n), x11=runif(n),
   x12=runif(n))
d$y <- with(d, 1*x1 + 2*x2 + 3*x3 +  4*x4  + 5*x5 + 6*x6 +
               7*x7 + 8*x8 + 9*x9 + 10*x10 + 11*x11 +
              12*x12 + 9*rnorm(n))

f <- ols(y ~ x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12, data=d)
B <- 20   # actually use B=1000
ranks <- matrix(NA, nrow=B, ncol=12)
rankvars <- function(fit)
  rank(plot(anova(fit), sort='none', pl=FALSE))
Rank <- rankvars(f)
for(i in 1:B) {
  j <- sample(1:n, n, TRUE)
  bootfit <- update(f, data=d, subset=j)
  ranks[i,] <- rankvars(bootfit)
  }
lim <- t(apply(ranks, 2, quantile, probs=c(.025,.975)))
predictor <- factor(names(Rank), names(Rank))
Dotplot(predictor ~ Cbind(Rank, lim), pch=3, xlab='Rank') 



