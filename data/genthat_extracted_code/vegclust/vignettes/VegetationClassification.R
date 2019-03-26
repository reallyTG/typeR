### R code from vignette source 'VegetationClassification.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: VegetationClassification.Rnw:21-22
###################################################
options(width=67)


###################################################
### code chunk number 2: VegetationClassification.Rnw:27-29
###################################################
library(vegclust)
library(vegan)


###################################################
### code chunk number 3: VegetationClassification.Rnw:34-36
###################################################
data(wetland)
dim(wetland)


###################################################
### code chunk number 4: VegetationClassification.Rnw:39-40
###################################################
wetlandchord = decostand(wetland,"normalize")


###################################################
### code chunk number 5: VegetationClassification.Rnw:43-44
###################################################
dchord = dist(wetlandchord)


###################################################
### code chunk number 6: VegetationClassification.Rnw:179-181
###################################################
wetland.km = vegclust(x = wetlandchord, mobileCenters=3, 
                      method="KM", nstart=20)


###################################################
### code chunk number 7: VegetationClassification.Rnw:184-185
###################################################
names(wetland.km)


###################################################
### code chunk number 8: VegetationClassification.Rnw:188-189
###################################################
t(wetland.km$memb)


###################################################
### code chunk number 9: VegetationClassification.Rnw:192-193
###################################################
round(wetland.km$mobileCenters, dig=3)


###################################################
### code chunk number 10: VegetationClassification.Rnw:196-199
###################################################
wetland.kmdist = vegclustdist(x = dchord, mobileMemb=3, 
                              method="KM", nstart = 20)
names(wetland.kmdist)


###################################################
### code chunk number 11: VegetationClassification.Rnw:202-203
###################################################
wetland.kmdist$mobileCenters


###################################################
### code chunk number 12: VegetationClassification.Rnw:206-207
###################################################
t(wetland.kmdist$memb)


###################################################
### code chunk number 13: VegetationClassification.Rnw:210-212
###################################################
wetland.km$mode
wetland.kmdist$mode


###################################################
### code chunk number 14: VegetationClassification.Rnw:218-219
###################################################
round(t(wetland.km$dist2clusters), dig=2)


###################################################
### code chunk number 15: VegetationClassification.Rnw:222-225
###################################################
wetland.fcm = vegclust(x = wetlandchord, mobileCenters=3, 
                       method="FCM", m=1.2, nstart=20)
round(t(wetland.fcm$memb), dig=3)


###################################################
### code chunk number 16: VegetationClassification.Rnw:230-233
###################################################
groups = defuzzify(wetland.fcm)$cluster
groups
table(groups)


###################################################
### code chunk number 17: VegetationClassification.Rnw:236-239
###################################################
groups = defuzzify(wetland.fcm, method = "cut", alpha = 0.8)$cluster
groups
table(groups, useNA = "always")


###################################################
### code chunk number 18: VegetationClassification.Rnw:242-245
###################################################
wetland.fcm2 = vegclust(x = wetlandchord, mobileCenters=3, 
                       method="FCM", m=10, nstart=20)
round(t(wetland.fcm2$memb), dig=3)


###################################################
### code chunk number 19: VegetationClassification.Rnw:248-250
###################################################
groups2 = defuzzify(wetland.fcm2, method = "cut", alpha = 0.8)$cluster
table(groups2, useNA = "always")


###################################################
### code chunk number 20: VegetationClassification.Rnw:256-259
###################################################
wetland.nc = vegclust(x = wetlandchord, mobileCenters=3,
                       method="NC", m=1.2, dnoise=0.8, nstart=20)
round(t(wetland.nc$memb), dig=2)


###################################################
### code chunk number 21: VegetationClassification.Rnw:262-265
###################################################
groups = defuzzify(wetland.nc)$cluster
groups
table(groups)


###################################################
### code chunk number 22: VegetationClassification.Rnw:268-271
###################################################
groups = defuzzify(wetland.nc, method="cut", alpha=0.8)$cluster
groups
table(groups, useNA = "always")


###################################################
### code chunk number 23: VegetationClassification.Rnw:276-279
###################################################
dist(wetland.km$mobileCenters)
dist(wetland.fcm$mobileCenters)
dist(wetland.nc$mobileCenters)


###################################################
### code chunk number 24: VegetationClassification.Rnw:285-288
###################################################
wetland.kmdd = vegclust(x = wetlandchord, mobileCenters=3, 
                      method="KMdd", nstart=20)
t(wetland.kmdd$memb)


###################################################
### code chunk number 25: VegetationClassification.Rnw:291-292
###################################################
round(wetland.kmdd$mobileCenters, dig=3)


###################################################
### code chunk number 26: VegetationClassification.Rnw:295-298
###################################################
wetland.kmdd = vegclustdist(x = dchord, mobileMemb=3, 
                      method="KMdd", nstart=20)
wetland.kmdd$mobileCenters


###################################################
### code chunk number 27: VegetationClassification.Rnw:303-309
###################################################
wetland.31 = wetlandchord[1:31,]
wetland.31 = wetland.31[,colSums(wetland.31)>0]
dim(wetland.31)
wetland.10 = wetlandchord[-(1:31),]
wetland.10 = wetland.10[,colSums(wetland.10)>0] 
dim(wetland.10)


###################################################
### code chunk number 28: VegetationClassification.Rnw:312-315
###################################################
km = kmeans(wetland.31, 2)
groups = km$cluster
groups


###################################################
### code chunk number 29: VegetationClassification.Rnw:318-319
###################################################
wetland.31.km = as.vegclust(wetland.31, groups)


###################################################
### code chunk number 30: VegetationClassification.Rnw:322-323
###################################################
wetland.31.km$method


###################################################
### code chunk number 31: VegetationClassification.Rnw:326-328
###################################################
wetland.10.km = vegclass(wetland.31.km, wetland.10)
defuzzify(wetland.10.km)$cluster


###################################################
### code chunk number 32: VegetationClassification.Rnw:331-332
###################################################
wetland.31.km.d = as.vegclust(dist(wetland.31), groups)


###################################################
### code chunk number 33: VegetationClassification.Rnw:335-336
###################################################
wetland.d.10.31 = as.data.frame(as.matrix(dchord)[32:41,1:31])


###################################################
### code chunk number 34: VegetationClassification.Rnw:339-341
###################################################
wetland.d.11.km = vegclass(wetland.31.km.d,wetland.d.10.31)
defuzzify(wetland.d.11.km)$cluster


###################################################
### code chunk number 35: VegetationClassification.Rnw:345-349
###################################################
wetland.31.nc = as.vegclust(wetland.31, groups, method="HNC", 
                            dnoise = 0.8)
wetland.10.nc = vegclass(wetland.31.nc, wetland.10)
defuzzify(wetland.10.nc)$cluster


###################################################
### code chunk number 36: VegetationClassification.Rnw:358-363
###################################################
cf = conformveg(wetland.31, wetland.10)
wetland.31.cf<- cf$x
wetland.10.cf<- cf$y
dim(wetland.31.cf)
dim(wetland.10.cf)


###################################################
### code chunk number 37: VegetationClassification.Rnw:369-370
###################################################
fixed = clustcentroid(wetland.31.cf, groups)


###################################################
### code chunk number 38: VegetationClassification.Rnw:376-381
###################################################
wetland.nc = vegclust(wetland.10.cf, mobileCenters=1, 
                      fixedCenters = fixed, 
                      method = wetland.31.nc$method,
                      dnoise=wetland.31.nc$dnoise, nstart=10)
defuzzify(wetland.nc)$cluster


###################################################
### code chunk number 39: VegetationClassification.Rnw:386-391
###################################################
wetland.km = vegclust(wetland.10.cf, mobileCenters=1, 
                      fixedCenters = fixed, 
                      method = "KM",
                      nstart=10)
defuzzify(wetland.km)$cluster


###################################################
### code chunk number 40: VegetationClassification.Rnw:398-403
###################################################
wetland.nc = vegclust(rbind(wetland.31.cf,wetland.10.cf), mobileCenters=1, 
                      fixedCenters = fixed, 
                      method = wetland.31.nc$method,
                      dnoise=wetland.31.nc$dnoise, nstart=10)
defuzzify(wetland.nc)$cluster


###################################################
### code chunk number 41: VegetationClassification.Rnw:409-410
###################################################
fixedDist = wetland.d.11.km$dist2clusters


###################################################
### code chunk number 42: VegetationClassification.Rnw:413-418
###################################################
wetland.km.d = vegclustdist(dist(wetland.10), mobileMemb = 1,
                            fixedDistToCenters=fixedDist, 
                            method = "KM",
                            nstart=10)
defuzzify(wetland.km.d)$cluster


###################################################
### code chunk number 43: VegetationClassification.Rnw:422-423
###################################################
fixedDist = rbind(wetland.31.km.d$dist2clusters, wetland.d.11.km$dist2clusters)


###################################################
### code chunk number 44: VegetationClassification.Rnw:426-431
###################################################
wetland.km.d = vegclustdist(dchord, mobileMemb = 1,
                            fixedDistToCenters=fixedDist, 
                            method = "KM",
                            nstart=10)
defuzzify(wetland.km.d)$cluster


###################################################
### code chunk number 45: VegetationClassification.Rnw:438-439
###################################################
groups = c(rep(1, 17), rep(2, 14), rep(3,10))


###################################################
### code chunk number 46: VegetationClassification.Rnw:446-448
###################################################
centroids = clustcentroid(wetlandchord, groups)
round(centroids, dig=3)


###################################################
### code chunk number 47: VegetationClassification.Rnw:452-454
###################################################
medoids = clustmedoid(wetlandchord, groups)
medoids


###################################################
### code chunk number 48: VegetationClassification.Rnw:465-466
###################################################
clustvar(wetlandchord, groups)


###################################################
### code chunk number 49: VegetationClassification.Rnw:478-479
###################################################
clustvar(dchord, groups)


###################################################
### code chunk number 50: VegetationClassification.Rnw:482-483
###################################################
clustvar(wetlandchord)


###################################################
### code chunk number 51: VegetationClassification.Rnw:488-489
###################################################
as.dist(as.matrix(dchord)[medoids,medoids])


###################################################
### code chunk number 52: VegetationClassification.Rnw:493-494
###################################################
dist(centroids)


###################################################
### code chunk number 53: VegetationClassification.Rnw:501-502
###################################################
interclustdist(dchord,groups)


###################################################
### code chunk number 54: VegetationClassification.Rnw:509-510
###################################################
c = clustconst(wetlandchord, memb = as.memb(groups))


###################################################
### code chunk number 55: VegetationClassification.Rnw:514-515
###################################################
d=summary(c, mode="all")


###################################################
### code chunk number 56: VegetationClassification.Rnw:519-520
###################################################
summary(c, mode="cluster", name=names(c)[1])


