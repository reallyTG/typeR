library(RSSampling)


### Name: Rrss
### Title: Selecting a robust ranked set sample
### Aliases: Rrss

### ** Examples

 data=rexp(10000)
 ## Selecting L-ranked set sample
 Rrss(data, m=8, r=3, sets=TRUE, alpha=0.2)
  ## Selecting Truncation-based ranked set sample
 Rrss(data, m=8, r=3, type="tb", sets=TRUE, alpha=0.1)
  ## Selecting Robust extreme ranked set sample
 Rrss(data, m=8, r=3, type="re", sets=TRUE, alpha=0.4)



