library(SixSigma)


### Name: ss.data.pb3
### Title: Particle Boards Example - Attribute data
### Aliases: ss.data.pb3
### Keywords: cc data

### ** Examples

data(ss.data.pb3)
summary(ss.data.pb3)
if (require(qcc)){
with(ss.data.pb3,
		plot(qcc(stockouts, orders, type ="p"))
	)
} else {
message("qcc package is needed to run this example")
}




