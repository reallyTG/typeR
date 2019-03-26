library(brt)


### Name: tpvalavg
### Title: Average of The Student t Distribution
### Aliases: tpvalavg
### Keywords: distribution

### ** Examples

x=seq(from=0, to=30, length.out=100)

data=do.call(
  rbind
  , lapply(
    seq_len(10)
    , function(cutoff)
      rbind(
        data.frame(x, pval=tpvalavg(x, hi=1, se=1, df=3), cutoff=cutoff)
        )
    )
  )

ggplot2::qplot(x, log(pval), data=data, color=as.factor(cutoff), 
	linetype=as.factor(cutoff), geom='line')
tpvalavg(1, hi=1, se=1, df=3)
exp(tpvalavg(1, hi=1, se=1, df=3, log=TRUE))



