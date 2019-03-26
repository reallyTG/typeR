library(LTRCtrees)


### Name: ICtree
### Title: Fit a survival tree for interval-censored survival data
### Aliases: ICtree

### ** Examples

library(interval)
library(LTRCtrees)
data(bcos)

## Fit ICtree survival tree
## make sure to attach survival package (by library(survival) ) before using Surv function
Ctree <- ICtree(Surv(left,right,type="interval2")~treatment, data = bcos)

## Plot the fitted tree
plot(Ctree)




