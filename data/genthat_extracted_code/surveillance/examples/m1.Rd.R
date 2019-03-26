library(surveillance)


### Name: m1
### Title: RKI SurvStat Data
### Aliases: m1 h1_nrwrp k1 m2 m3 m4 m5 n1 n2 q1_nrwh q2 s1 s2 s3
### Keywords: datasets

### ** Examples

data(k1)
survResObj <- algo.rki1(k1, control=list(range=27:192))
plot(survResObj, "RKI 1", "k1", firstweek=27, startyear=2002)



