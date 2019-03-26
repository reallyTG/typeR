library(brt)


### Name: tpvalint
### Title: Hypothesis testing using the Student t Distribution with H0: lo
###   <= mu <= hi
### Aliases: tpvalint
### Keywords: htest

### ** Examples

x=seq(from=-30, to=30, length.out=100)

data=do.call(
  rbind
  , lapply(
    seq_len(10)
    , function(cutoff)
      rbind(
        data.frame(x, pval=tpvalint(x, lo=-cutoff, hi=cutoff, se=1, df=3), cutoff=cutoff)
        )
    )
  )

ggplot2::qplot(x, pval, data=data, color=as.factor(cutoff), linetype=as.factor(cutoff), geom='line')



