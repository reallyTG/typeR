library(SixSigma)


### Name: ss.data.pb2
### Title: Particle Boards Example - by Groups
### Aliases: ss.data.pb2
### Keywords: cc data

### ** Examples

data(ss.data.pb2)
summary(ss.data.pb2)
if (require(qcc)){
  pb.groups.xbar <- with(ss.data.pb2, qcc.groups(pb.humidity, pb.group))
  pb.xbar <- qcc(pb.groups.xbar, type="xbar")
  summary(pb.xbar)
} else {
message("qcc package is needed to run this example")
}




