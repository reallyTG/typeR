library(rms)


### Name: cr.setup
### Title: Continuation Ratio Ordinal Logistic Setup
### Aliases: cr.setup
### Keywords: category models regression

### ** Examples

y <- c(NA, 10, 21, 32, 32)
cr.setup(y)


set.seed(171)
y <- sample(0:2, 100, rep=TRUE)
sex <- sample(c("f","m"),100,rep=TRUE)
sex <- factor(sex)
table(sex, y)
options(digits=5)
tapply(y==0, sex, mean)
tapply(y==1, sex, mean)
tapply(y==2, sex, mean)
cohort <- y>=1
tapply(y[cohort]==1, sex[cohort], mean)

u <- cr.setup(y)
Y <- u$y
cohort <- u$cohort
sex <- sex[u$subs]

lrm(Y ~ cohort + sex)
 
f <- lrm(Y ~ cohort*sex)   # saturated model - has to fit all data cells
f

#Prob(y=0|female):
# plogis(-.50078)
#Prob(y=0|male):
# plogis(-.50078+.11301)
#Prob(y=1|y>=1, female):
plogis(-.50078+.31845)
#Prob(y=1|y>=1, male):
plogis(-.50078+.31845+.11301-.07379)

combinations <- expand.grid(cohort=levels(cohort), sex=levels(sex))
combinations
p <- predict(f, combinations, type="fitted")
p
p0 <- p[c(1,3)]
p1 <- p[c(2,4)]
p1.unconditional <- (1 - p0) *p1
p1.unconditional
p2.unconditional <- 1 - p0 - p1.unconditional
p2.unconditional


## Not run: 
##D dd <- datadist(inputdata)   # do this on non-replicated data
##D options(datadist='dd')
##D pain.severity <- inputdata$pain.severity
##D u <- cr.setup(pain.severity)
##D # inputdata frame has age, sex with pain.severity
##D attach(inputdata[u$subs,])  # replicate age, sex
##D # If age, sex already available, could do age <- age[u$subs] etc., or
##D # age <- rep(age, u$reps), etc.
##D y      <- u$y
##D cohort <- u$cohort
##D dd     <- datadist(dd, cohort)       # add to dd
##D f <- lrm(y ~ cohort + age*sex)       # ordinary cont. ratio model
##D g <- lrm(y ~ cohort*sex + age, x=TRUE,y=TRUE) # allow unequal slopes for
##D                                      # sex across cutoffs
##D cal <- calibrate(g, cluster=u$subs, subset=cohort=='all')  
##D # subs makes bootstrap sample the correct units, subset causes
##D # Predicted Prob(pain.severity=0) to be checked for calibration
## End(Not run)



