library(TraMineRextras)


### Name: HSPELL_to_STS
### Title: Data conversion from Horizontal Spell to STS.
### Aliases: HSPELL_to_STS
### Keywords: data format

### ** Examples

hspell <- data.frame(begin1=rep(1, 5), end1=c(2:5, NA), status1=1:5,
                     begin2=c(3:6, NA), end2=rep(NA, 5), status2=5:1)
sts <- HSPELL_to_STS(hspell, begin=c("begin1", "begin2"), end=c("end1", "end2"),
                     status=c("status1", "status2"))



