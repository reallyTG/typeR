library(sigr)


### Name: wrapFTest.summary.lm
### Title: Wrap quality statistic of linear regression summary.
### Aliases: wrapFTest.summary.lm

### ** Examples


d <- data.frame(x=c(1,2,3,4,5,6,7,7),
                y=c(1,1,2,2,3,3,4,4))
model <- lm(y~x,data=d)
sum <- summary(model)
sigr::wrapFTest(sum)





