library(MPTinR)


### Name: ROCs
### Title: Recognition memory ROCs used by Klauer & Kellen (2015)
### Aliases: roc6 roc8
### Keywords: datasets

### ** Examples

## Not run: 
##D # This example shows only how to fit the 6-point ROCs
##D data("roc6")
##D 
##D # 2HTM (2-high threshold model)
##D htm <- "
##D (1-Do)*(1-g)*(1-gn1)*(1-gn2)
##D (1-Do)*(1-g)*(1-gn1)*gn2
##D (1-Do)*(1-g)*gn1
##D Do*(1-do1)*(1-do2)  + (1-Do)*g*go1
##D Do*do1 + (1-Do)*g*(1-go1)*go2
##D Do*(1-do1)*do2 + (1-Do)*g*(1-go1)*(1-go2)
##D 
##D Dn*(1-dn1)*dn2 + (1-Dn)*(1-g)*(1-gn1)*(1-gn2)
##D Dn*dn1 + (1-Dn)*(1-g)*(1-gn1)*gn2
##D Dn*(1-dn1)*(1-dn2) + (1-Dn)*(1-g)*gn1
##D (1-Dn)*g*go1
##D (1-Dn)*g*(1-go1)*go2
##D (1-Dn)*g*(1-go1)*(1-go2)
##D "
##D 
##D # full 2HTM is over-parametereized:
##D check.mpt(textConnection(htm))
##D # apply some symmetric response mapping restrictions for D and g:
##D check.mpt(textConnection(htm), list("dn2 = do2", "gn2 = go2"))
##D 
##D 
##D 
##D # UVSD (unequal variance signal detection model)
##D uvsd <- "
##D pnorm(cr1, mu, sigma)
##D pnorm(cr1+cr2, mu, sigma) - pnorm(cr1, mu, sigma)
##D pnorm(cr3+cr2+cr1, mu, sigma) - pnorm(cr2+cr1, mu, sigma)
##D pnorm(cr4+cr3+cr2+cr1, mu, sigma) - pnorm(cr3+cr2+cr1, mu, sigma)
##D pnorm(cr5+cr4+cr3+cr2+cr1, mu, sigma) - pnorm(cr4+cr3+cr2+cr1, mu, sigma)
##D 1 - pnorm(cr5+cr4+cr3+cr2+cr1, mu, sigma)
##D   
##D pnorm(cr1)
##D pnorm(cr2+cr1) - pnorm(cr1)
##D pnorm(cr3+cr2+cr1) - pnorm(cr2+cr1)
##D pnorm(cr4+cr3+cr2+cr1) - pnorm(cr3+cr2+cr1)
##D pnorm(cr5+cr4+cr3+cr2+cr1) - pnorm(cr4+cr3+cr2+cr1)
##D 1 - pnorm(cr5+cr4+cr3+cr2+cr1)
##D "
##D 
##D # confidence criteria are parameterized as increments:
##D check.mpt(textConnection(uvsd))
##D # cr1 = [-Inf, Inf]
##D # cr2, cr3, cr4, cr5 = [0, Inf]
##D # mu = [-Inf, Inf]
##D # sigma = [0, Inf]
##D 
##D 
##D # MSD (mixture signal detection model): 
##D # NOTE: To follow CRAN rules restricting examples to a width of 100 characters, 
##D # the following example is splitted into multiple strings concatenated by paste().
##D # To view the full model use: cat(msd)
##D msd <- paste(c("
##D l*(pnorm(cr1-mu))  +  (1 - l) * (pnorm(cr1-mu2))
##D l*(pnorm(cr1+cr2-mu) - pnorm(cr1-mu)) + (1 - l)*(pnorm(cr1+cr2-mu2)-pnorm(cr1-mu2))
##D l*(pnorm(cr1+cr2+cr3-mu)-pnorm(cr1+cr2-mu)) + (1-l)*(pnorm(cr1+cr2+cr3-mu2)-pnorm(cr1+cr2-mu2))
##D ",
##D "l*(pnorm(cr1+cr2+cr3+cr4-mu) - pnorm(cr1+cr2+cr3-mu)) + ",
##D "(1 - l)*(pnorm(cr1+cr2+cr3+cr4-mu2)-pnorm(cr1+cr2+cr3-mu2))",
##D "
##D l*(pnorm(cr1+cr2+cr3+cr4+cr5-mu)-pnorm(cr1+cr2+cr3+cr4-mu)) + ",
##D "(1 - l)*(pnorm(cr1+cr2+cr3+cr4+cr5-mu2)-pnorm(cr1+cr2+cr3+cr4-mu2))",
##D "
##D l * (1-pnorm(cr1+cr2+cr3+cr4+cr5-mu))  +  (1 - l)*(1-pnorm(cr1+cr2+cr3+cr4+cr5-mu2))
##D 
##D pnorm(cr1)
##D pnorm(cr1+cr2) - pnorm(cr1)
##D pnorm(cr1+cr2+cr3) - pnorm(cr1+cr2)
##D pnorm(cr1+cr2+cr3+cr4) - pnorm(cr1+cr2+cr3)
##D pnorm(cr1+cr2+cr3+cr4+cr5) - pnorm(cr1+cr2+cr3+cr4)
##D 1-pnorm(cr1+cr2+cr3+cr4+cr5)
##D "), collapse = "") 
##D cat(msd)
##D 
##D # confidence criteria are again parameterized as increments:
##D check.mpt(textConnection(msd))
##D # cr1 = [-Inf, Inf]
##D # cr2, cr3, cr4, cr5 = [0, Inf]
##D # lambda = [0, 1]
##D # mu, mu2 = [-Inf, Inf]
##D 
##D 
##D # DPSD (dual-process signal detection model)
##D dpsd <- "
##D (1-R)*pnorm(cr1- mu)
##D (1-R)*(pnorm(cr1 + cr2 - mu) - pnorm(cr1 - mu))
##D (1-R)*(pnorm(cr1 + cr2 + cr3 - mu) - pnorm(cr1 + cr2 - mu))
##D (1-R)*(pnorm(cr1 + cr2 + cr3 + cr4 - mu) - pnorm(cr1 + cr2 + cr3 - mu))
##D (1-R)*(pnorm(cr1 + cr2 + cr3 + cr4 + cr5 - mu) - pnorm(cr1 + cr2 + cr3 + cr4 - mu))
##D R + (1-R)*(1 - pnorm(cr1 + cr2 + cr3 + cr4 + cr5 - mu))
##D 
##D pnorm(cr1)
##D pnorm(cr1 + cr2) - pnorm(cr1)
##D pnorm(cr1 + cr2 + cr3) - pnorm(cr1 + cr2)
##D pnorm(cr1 + cr2 + cr3 + cr4) - pnorm(cr1 + cr2 + cr3)
##D pnorm(cr1 + cr2 + cr3 + cr4 + cr5) - pnorm(cr1 + cr2 + cr3 + cr4)
##D 1 - pnorm(cr1 + cr2 + cr3 + cr4 + cr5)
##D "
##D 
##D uvsd_fit <- fit.model(roc6[,1:12], textConnection(uvsd),
##D             lower.bound=c(-Inf, rep(0, 5), 0.001), upper.bound=Inf)
##D 
##D msd_fit <- fit.model(roc6[,1:12], textConnection(msd),
##D             lower.bound=c(-Inf, rep(0, 7)), upper.bound=c(rep(Inf, 5), 1, Inf, Inf))
##D 
##D dpsd_fit <- fit.model(roc6[,1:12], textConnection(dpsd),
##D             lower.bound=c(-Inf, rep(0, 6)), upper.bound=c(rep(Inf, 6), 1))
##D 
##D htm_fit <- fit.mpt(roc6[,1:12], textConnection(htm), 
##D                    list("dn2 = do2", "gn2 = go2"))
##D 
##D select.mpt(list(uvsd_fit, dpsd_fit, msd_fit, htm_fit))
##D # Note that the AIC and BIC results do not adequately take model flexibility into account.
##D ##      model n.parameters G.Squared.sum df.sum p.sum p.smaller.05
##D ## 1 uvsd_fit            7      1820.568   1377     0           50
##D ## 2 dpsd_fit            7      2074.188   1377     0           64
##D ## 3  msd_fit            8      1345.595    918     0           51
##D ## 4  htm_fit            9      1994.217    459     0          138
##D ##   delta.AIC.sum wAIC.sum AIC.best delta.BIC.sum wBIC.sum BIC.best
##D ## 1        0.0000        1      230        0.0000        1      273
##D ## 2      253.6197        0      161      253.6197        0      183
##D ## 3      443.0270        0       16     4996.8517        0        3
##D ## 4     2009.6489        0       56    11117.2982        0        4
## End(Not run)



