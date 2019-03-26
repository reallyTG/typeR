library(gmnl)


### Name: wtp.gmnl
### Title: Compute Willingness-to-pay
### Aliases: wtp.gmnl

### ** Examples


## Examples using the Electricity data set from the mlogit package
library(mlogit)
data("Electricity", package = "mlogit")
Electr <- mlogit.data(Electricity, id.var = "id", choice = "choice",
                     varying = 3:26, shape = "wide", sep = "")
                     
## Estimate a conditional logit model
clogit <- gmnl(choice ~ pf + cl + loc + wk + tod + seas| 0,
               data = Electr)
wtp.gmnl(clogit, wrt = "pf")



