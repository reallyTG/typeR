library(sads)


### Name: fitrad
### Title: ML fitting of species rank-abundance distributions
### Aliases: fitrad fitgs fitmand fitrbs fitzipf

### ** Examples


## Figure 2 of Motomura (1932)
data(okland)
plot(rad(okland))
ok.gs <- fitrad(okland, "gs")
lines(radpred(ok.gs))

## Comparison with Zipf-Mandelbrodt
ok.zm <- fitrad(okland, "mand")
AICctab(ok.gs, ok.zm, nobs=length(okland))
lines(radpred(ok.zm), col="red")



