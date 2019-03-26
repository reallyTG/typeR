library(survAUC)


### Name: GHCI
### Title: Gonen and Heller's Concordance Index for Cox models
### Aliases: GHCI
### Keywords: classif

### ** Examples


TR <- ovarian[1:16,]
TE <- ovarian[17:26,]
train.fit  <- coxph(Surv(futime, fustat) ~ age,
                    x=TRUE, y=TRUE, method="breslow", data=TR)

lpnew <- predict(train.fit, newdata=TE)
                 
GHCI(lpnew)




