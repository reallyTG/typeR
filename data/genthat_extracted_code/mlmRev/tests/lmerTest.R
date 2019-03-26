####  LMER: Put all the small data set tests into one file
library(mlmRev)
options(digits=6, show.signif.stars = FALSE)
old_optimizer = lmerControl(optimizer = "bobyqa")  # use an older default

## bdf ---------------- Data ---------------------
(fm01 <- lmer(langPOST ~ IQ.ver.cen + avg.IQ.ver.cen +         (1|schoolNR), bdf,
              control = old_optimizer))
(fm02 <- lmer(langPOST ~ IQ.ver.cen + avg.IQ.ver.cen +(IQ.ver.cen|schoolNR), bdf,
              control = old_optimizer))
##
anova(fm01, fm02)
cat('Time elapsed: ', (.pt <- proc.time()),'\n') # "stats"

## egsingle ----------- Data ---------------------
(fm1 <- lmer(math ~ year +    (1|childid) +    (1|schoolid), egsingle,
             control = old_optimizer))
(fm2 <- lmer(math ~ year +    (1|childid) + (year|schoolid), egsingle,
             control = old_optimizer))
(fm3 <- lmer(math ~ year + (year|childid) +    (1|schoolid), egsingle,
             control = old_optimizer))
(fm4 <- lmer(math ~ year + (year|childid) + (year|schoolid), egsingle,
             control = old_optimizer))
##
anova(fm1, fm2, fm3, fm4)
cat('Time elapsed: ', {.ot <- .pt; (.pt <- proc.time()) - .ot},'\n') # "stats"

## Early -------------- Data ---------------------
Early$tos <- Early$age - 0.5
(fm1E <- lmer(cog ~ tos * trt + (tos|id), Early,
              control = old_optimizer))

## Exam --------------- Data ---------------------
(fm05 <- lmer(normexam ~ standLRT + sex + schgend + (1|school), Exam,
              control = old_optimizer))

## Chem97 ------------- Data ---------------------
(fm06 <- lmer(score ~ gcsecnt + (1|school) + (1|lea), Chem97,
              control = old_optimizer))

cat('Time elapsed: ', {.ot <- .pt; (.pt <- proc.time()) - .ot},'\n') # "stats"

## Hsb82 -------------- Data ---------------------
lmer(mAch ~ meanses*cses + sector*cses + (cses|school), Hsb82,
     control = old_optimizer)

## Oxford ------------- Data ---------------------
(fm07 <- lmer(height ~ age + I(age^2) + I(age^3) + I(age^4) +
              (age + I(age^2)|Subject),  data = Oxboys,
              control = old_optimizer))
(fm08 <- lmer(height ~ poly(age,4) +
              (age + I(age^2)|Subject),  data = Oxboys,
              control = old_optimizer))
anova(fm07, fm08)
stopifnot(all.equal(logLik(fm07, REML=FALSE),
                    logLik(fm08, REML=FALSE), tol=1e-07))
cat('Time elapsed: ', {.ot <- .pt; (.pt <- proc.time()) - .ot},'\n') # "stats"

## ScotsSec ----------- Data ---------------------
cntr <- list()
(fmS1 <- lmer(attain ~ verbal * sex + (1|primary) + (1|second), ScotsSec,
             verbose = 1,
             control = old_optimizer))
#(fmS2 <- lmer(attain ~ verbal * sex + (1|primary) + (1|second), ScotsSec,
#             control = c(cntr, list(niterEM = 40))))
## fmS1 and fmS2 should be essentially identical when optimizing with nlminb
## The fits are substantially different when optimizing with optim
##
(fmS3 <- lmer(attain ~ verbal + sex + (1|primary) +   (1|second), ScotsSec,
              control = old_optimizer))
(fmS4 <- lmer(attain ~ verbal + sex + (1|primary) + (sex|second), ScotsSec,
              control = old_optimizer))
##
anova(fmS1, fmS3, fmS4)

cat('Time elapsed: ', {.ot <- .pt; (.pt <- proc.time()) - .ot},'\n') # "stats"
