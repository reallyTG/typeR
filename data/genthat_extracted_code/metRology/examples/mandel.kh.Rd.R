library(metRology)


### Name: mandel.kh
### Title: Calculate Mandel's h and k statistics for replicate observations
### Aliases: mandel.kh mandel.kh.default mandel.kh.data.frame
###   mandel.kh.matrix mandel.kh.array mandel.kh.ilab
### Keywords: univar

### ** Examples

	data(RMstudy)

	#Data frame examples: note no secondary grouping factor
	h <- with(RMstudy, mandel.kh(RMstudy[2:9], g=Lab, type="h"))
	plot(h, las=2)

	k <- with(RMstudy, mandel.kh(RMstudy[2:9], g=Lab, type="k"))
	plot(k, las=2)

	#Vector variant
	RMstk <- stack(RMstudy[,2:9])
	names(RMstk) <- c("x", "meas")
		#names replace 'values' and 'ind'
	RMstk$Lab <- rep(RMstudy$Lab, 8)
	h2 <- with(RMstk, mandel.kh(x, g=Lab, m=meas, rowname="Laboratory"))
		#Note use of rowname to override g
	plot(h2, las=2)
	
	#ilab method
	RM.ilab <- with(RMstk, construct.ilab(org=Lab, x=x, measurand=meas, 
		item=factor(rep("CRM", nrow(RMstk))) ) )

	plot(mandel.kh(RM.ilab, type="h"))
	
	#Robust variants
	hrob <- with(RMstudy, mandel.kh(RMstudy[2:9], g=Lab, type="h", method="robust"))
	plot(hrob, las=2)
	
	krob <- with(RMstudy, mandel.kh(RMstudy[2:9], g=Lab, type="k", method="robust"))
	plot(krob, las=2)



