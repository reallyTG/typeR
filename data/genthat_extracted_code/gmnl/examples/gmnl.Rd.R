library(gmnl)


### Name: gmnl
### Title: Estimate Multinomial Logit Models with Observed and Unobserved
###   Individual Heterogeneity.
### Aliases: coef.gmnl df.residual.gmnl fitted.gmnl gmnl logLik.gmnl
###   model.matrix.gmnl nObs.gmnl print.gmnl print.summary.gmnl
###   residuals.gmnl summary.gmnl update.gmnl

### ** Examples

## Examples using the Fishing data set from the AER package
data("TravelMode", package = "AER")
library(mlogit)
TM <- mlogit.data(TravelMode, choice = "choice", shape = "long", 
                 alt.levels = c("air", "train", "bus", "car"), chid.var = "individual")
## Not run: 
##D ## S-MNL model, ASCs not scaled
##D smnl <- gmnl(choice ~ wait + vcost + travel + gcost| 1, data = TM, 
##D              model = "smnl", R = 100, 
##D              notscale = c(1, 1, 1, rep(0, 4)))
##D summary(smnl)
##D 
##D ## MIXL model with observed heterogeneity
##D mixl.hier <- gmnl(choice ~ vcost + gcost + travel + wait | 1 | 0 | income + size - 1,
##D                  data = TM,
##D                  model = "mixl",
##D                  ranp = c(travel = "t", wait = "n"),
##D                  mvar = list(travel = c("income","size"), wait = c("income")),
##D                  R = 30,
##D                  haltons = list("primes"= c(2, 17), "drop" = rep(19, 2)))
##D summary(mixl.hier)
##D 
##D ## Examples using the Electricity data set from the mlogit package
##D data("Electricity", package = "mlogit")
##D Electr <- mlogit.data(Electricity, id.var = "id", choice = "choice",
##D                      varying = 3:26, shape = "wide", sep = "")
##D                      
##D ## Estimate a MIXL model with correlated random parameters
##D Elec.cor <- gmnl(choice ~ pf + cl + loc + wk + tod + seas| 0, data = Electr,
##D                  subset = 1:3000,
##D                  model = 'mixl',
##D                  R = 10,
##D                  panel = TRUE,
##D                  ranp = c(cl = "n", loc = "n", wk = "n", tod = "n", seas = "n"),
##D                  correlation = TRUE)
##D summary(Elec.cor)
##D cov.gmnl(Elec.cor)
##D se.cov.gmnl(Elec.cor)
##D se.cov.gmnl(Elec.cor, sd = TRUE)
##D cor.gmnl(Elec.cor)
##D 
##D ## Estimate a G-MNL model, where ASCs are also random
##D Electr$asc2 <- as.numeric(Electr$alt == 2)
##D Electr$asc3 <- as.numeric(Electr$alt == 3)
##D Electr$asc4 <- as.numeric(Electr$alt == 4)
##D 
##D Elec.gmnl <- gmnl(choice ~ pf + cl + loc + wk + tod + seas + asc2 + asc3 + asc4 | 0,
##D                  data = Electr,
##D                  subset = 1:3000,
##D                  model = 'gmnl',
##D                  R = 30,
##D                  panel = TRUE,
##D                  notscale = c(rep(0, 6), 1, 1, 1),
##D                  ranp = c(cl = "n", loc = "n", wk = "n", tod = "n", seas = "n",
##D                  asc2 = "n", asc3 = "n", asc4 = "n"))
##D summary(Elec.gmnl)
##D 
##D ## Estimate a LC model with 2 classes
##D Elec.lc <- gmnl(choice ~ pf + cl + loc + wk + tod + seas| 0 | 0 | 0 | 1,
##D                data = Electr,
##D                subset = 1:3000,
##D                model = 'lc',
##D                panel = TRUE,
##D                Q = 2)
##D summary(Elec.lc)
##D 
##D ## Estimate a MM-MIXL model
##D Elec.mm <- gmnl(choice ~ pf + cl + loc + wk + tod + seas| 0 | 0 | 0 | 1,
##D                  data = Electr,
##D                  subset = 1:3000,
##D                  model = 'mm',
##D                  R = 30,
##D                  panel = TRUE,
##D                  ranp = c(pf = "n", cl = "n", loc = "n", wk = "n", tod = "n",
##D                  seas = "n"),
##D                  Q = 2,
##D                  iterlim = 500)
##D summary(Elec.mm)
## End(Not run)



