library(HAPim)


### Name: haplomax.HS.add
### Title: HaploMax method in half-sib family design
### Aliases: haplomax.HS.add
### Keywords: models

### ** Examples


data(data.test)
map=data.test[[1]]
hap.trans.mere=data.test[[2]]
hap.trans.pere=data.test[[3]]
hap.chrom1.pere=data.test[[4]]
hap.chrom2.pere=data.test[[5]]
perf=data.test[[6]]
CD=data.test[[7]]
genea=data.test[[9]]

# In this example, marker positions are : 0, 0.010, 0.020, 0.030, 0.040, 0.050, 0.060,
# 0.070, 0.080, 0.090. 
# we use a 2 markers-associated haplotype

marq.hap=2

haplomax.HS=haplomax.HS.add(hap.chrom1.pere,hap.chrom2.pere,hap.trans.pere,hap.trans.mere,

perf,CD,genea,map,marq.hap)

haplomax.HS




