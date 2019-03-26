library(SixSigma)


### Name: ss.data.pb1
### Title: Particle Boards Example - Individual Data
### Aliases: ss.data.pb1
### Keywords: cc data

### ** Examples

data(ss.data.pb1)
summary(ss.data.pb1)
library(qcc)
pb.groups.one <- with(ss.data.pb1, qcc.groups(pb.humidity, pb.group))
pb.xbar.one <- qcc(pb.groups.one, type="xbar.one")
summary(pb.xbar.one)
plot(pb.xbar.one)




