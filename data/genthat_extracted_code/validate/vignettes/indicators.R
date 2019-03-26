## ----echo=FALSE----------------------------------------------------------
library(validate)

## ------------------------------------------------------------------------
i <- indicator(
    mh  = mean(height)
  , mw  = mean(weight)
  , BMI = (weight/2.2046)/(height*0.0254)^2 )
ind <- confront(women, i)

## ------------------------------------------------------------------------
ind

## ------------------------------------------------------------------------
summary(ind)

## ------------------------------------------------------------------------
jj <- indicator(mh = mean(height), a = {"A"})

## ------------------------------------------------------------------------
cf <- confront(women, jj)
cf
warnings(cf)

## ------------------------------------------------------------------------
women$id <- letters[1:15]

## ------------------------------------------------------------------------
ind <- confront(women, i,key="id")
(out <- as.data.frame(ind))

## ------------------------------------------------------------------------
idf <- data.frame(
  rule = c("mean(height)","sd(height)")
  , label = c("average height", "std.dev height")
  , description = c("basic statistic","fancy statistic")
)
i <- indicator(.data=idf)
i

## ------------------------------------------------------------------------
quality <- as.data.frame(confront(women, i))
measures <- as.data.frame(i)
merge(quality, measures)

