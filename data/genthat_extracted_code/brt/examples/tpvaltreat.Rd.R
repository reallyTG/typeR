library(brt)


### Name: tpvaltreat
### Title: Hypothesis testing using the Student t Distribution with H0:
###   abs(mu) <= delta
### Aliases: tpvaltreat
### Keywords: htest

### ** Examples

x=seq(from=-30, to=30, length.out=100)

data=do.call(
  rbind
  , lapply(
    seq_len(10)
    , function(delta)
      rbind(
        data.frame(x, pval=tpvaltreat(x, delta=delta, se=1, df=3), delta=delta)
        )
    )
  )

ggplot2::qplot(x, pval, data=data, color=as.factor(delta), linetype=as.factor(delta), geom='line')



