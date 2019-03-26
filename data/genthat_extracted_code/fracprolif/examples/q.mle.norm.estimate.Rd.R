library(fracprolif)


### Name: q.mle.norm.estimate
### Title: Estimate Distribution Parameters based on EMG survival
### Aliases: q.mle.norm.estimate

### ** Examples

  data(ca1d.erlotinib)
  mitotic.lifespans <-
    subset(ca1d.erlotinib, !End.of.Expt & 
                           !Death        & 
                           !is.na(Lifespan))$Lifespan
  censored.lifespans <- 
    subset(ca1d.erlotinib, End.of.Expt  & 
                           !Death        & 
                           !is.na(Lifespan))$Lifespan
  q.mle.norm.estimate(mitotic.lifespans, censored.lifespans)



