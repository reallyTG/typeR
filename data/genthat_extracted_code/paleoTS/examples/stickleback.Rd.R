library(paleoTS)


### Name: Stickleback data
### Title: Stickleback data from Bell et al. (2006)
### Aliases: dorsal.spines pterygiophores pelvic.score
### Keywords: datasets

### ** Examples

data(dorsal.spines)

# get subset of samples from invading lineage (tt>=4.5 Kyr), only those with nn>=5
ok<- dorsal.spines$tt >= 4.5 & dorsal.spines$nn >=5
ds2<- sub.paleoTS(dorsal.spines, ok=ok)

# convert time scale to generations (500 gen per Kyr), reset starting time to t=0
ds2$tt<- ds2$tt*(1000/2)	
ds2$tt<- ds2$tt - ds2$tt[1]

# compare URW (drift) and OU (adaptive) models
m.urw<- opt.joint.URW(ds2, pool=TRUE)
m.ou<- opt.joint.OU(ds2, pool=TRUE)
compareModels(m.urw, m.ou)

plot(ds2, modelFit=m.ou, pool=TRUE)




