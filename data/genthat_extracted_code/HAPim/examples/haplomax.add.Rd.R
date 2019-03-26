library(HAPim)


### Name: haplomax.add
### Title: HaploMax method in unrelated population
### Aliases: haplomax.add
### Keywords: models

### ** Examples


data(data.test)
map=data.test[[1]]
hap.trans.mere=data.test[[2]]
hap.trans.pere=data.test[[3]]
perf=data.test[[6]]
CD=data.test[[7]]

# In this example,marker positions are: {0, 0.010, 0.020, 0.030, 0.040, 0.050, 0.060, 
# 0.070, 0.080, 0.090 }. 
# we use a 2 markers-associated haplotype.
marq.hap=2

haplomax=haplomax.add(hap.trans.pere,hap.trans.mere,perf,CD,map, marq.hap)

haplomax




