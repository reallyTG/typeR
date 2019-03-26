library(metRology)


### Name: mandel.h
### Title: Calculate Mandel's h statistics for replicate observations
### Aliases: mandel.h mandel.h.default mandel.h.data.frame mandel.h.matrix
###   mandel.h.array mandel.h.ilab
### Keywords: univar

### ** Examples

	data(RMstudy)

	#Data frame examples: note no secondary grouping factor
	h <- with(RMstudy, mandel.h(RMstudy[2:9], g=Lab))
	plot(h, las=2)

	#Vector variant
	RMstk <- stack(RMstudy[,2:9])
	names(RMstk) <- c("x", "meas")
		#names replace 'values' and 'ind'
	RMstk$Lab <- rep(RMstudy$Lab, 8)
	h2 <- with(RMstk, mandel.h(x, g=Lab, m=meas, rowname="Laboratory"))
		#Note use of rowname to override g
	plot(h2, las=2)
	
	#ilab method
	RM.ilab <- with(RMstk, construct.ilab(org=Lab, x=x, measurand=meas, 
		item=factor(rep("CRM", nrow(RMstk))) ) )

	plot(mandel.h(RM.ilab))
	
	#Robust variant
	hrob <- with(RMstudy, mandel.kh(RMstudy[2:9], g=Lab, type="h", method="robust"))
	plot(hrob, las=2)
	



