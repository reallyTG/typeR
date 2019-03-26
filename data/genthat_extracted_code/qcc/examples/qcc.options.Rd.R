library(qcc)


### Name: qcc.options
### Title: Set or return options for the 'qcc' package.
### Aliases: qcc.options
### Keywords: htest hplot

### ** Examples

old <- qcc.options()			# save defaults
qcc.options("cex.stats")		# get a single parameter
qcc.options("cex.stats"=1.2)	# change parameters
qcc.options(bg.margin="azure2")
qcc.options("violating.runs" = list(pch = 15, col = "purple"))
qcc.options("beyond.limits" = list(pch = 15, col = "orangered"))
qcc(rnorm(100), type = "xbar.one", std.dev = 0.7)	# see the results
qcc.options(old)				# restore old defaults 



