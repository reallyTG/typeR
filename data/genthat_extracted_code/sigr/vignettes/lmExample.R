## ------------------------------------------------------------------------
library('sigr')
set.seed(352532)
d <- data.frame(x=1:10, z=c(4,5))
d$y <- 2*d$x + 0.1*rnorm(nrow(d))


## ----lm------------------------------------------------------------------
model <- lm(y~x+z, data=d)
d$pred <- predict(model, newdata = d)

s <- summary(model)
print(s)
print(s$fstatistic)

## ----cortest1, results='asis'--------------------------------------------
cat(render(wrapFTest(model),
    pSmallCutoff=0))

## ----cortestp, results='asis'--------------------------------------------
cat(render(wrapFTest(d, 'pred', 'y', nParameters=2),
    pSmallCutoff=0))

## ----cortestpwrong, results='asis'---------------------------------------
cat(render(wrapFTest(d, 'pred', 'y'),
    pSmallCutoff=0))

