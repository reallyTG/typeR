library(lavaSearch2)


### Name: compare2
### Title: Test Linear Hypotheses with small sample correction
### Aliases: compare2 compare2.lm compare2.gls compare2.lme compare2.lvmfit
###   compare2.lm2 compare2.gls2 compare2.lme2 compare2.lvmfit2 .compare2

### ** Examples

#### simulate data ####
set.seed(10)
mSim <- lvm(Y~0.1*X1+0.2*X2)
categorical(mSim, labels = c("a","b","c")) <- ~X1
transform(mSim, Id~Y) <- function(x){1:NROW(x)}
df.data <- lava::sim(mSim, 1e2)

#### with lm ####
## direct use of compare2
e.lm <- lm(Y~X1+X2, data = df.data)
anova(e.lm)
compare2(e.lm, par = c("X1b=0","X1c=0"))

## or first compute the derivative of the information matrix
sCorrect(e.lm) <- TRUE

## and define the contrast matrix
C <- createContrast(e.lm, par = c("X1b=0","X1c=0"), add.variance = TRUE)

## run compare2
compare2(e.lm, contrast = C$contrast, null = C$null)
compare2(e.lm, contrast = C$contrast, null = C$null, robust = TRUE)

#### with gls ####
library(nlme)
e.gls <- gls(Y~X1+X2, data = df.data, method = "ML")

## first compute the derivative of the information matrix
sCorrect(e.gls, cluster = 1:NROW(df.data)) <- TRUE

compare2(e.gls, par = c("5*X1b+2*X2 = 0","(Intercept) = 0"))

#### with lvm ####
m <- lvm(Y~X1+X2)
e.lvm <- estimate(m, df.data)

compare2(e.lvm, par = c("-Y","Y~X1b+Y~X1c"))



