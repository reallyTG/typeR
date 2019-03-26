library(metRology)


### Name: mandel.k
### Title: Calculate Mandel's k statistics for replicate observations
### Aliases: mandel.k mandel.k.default mandel.k.data.frame mandel.k.matrix
###   mandel.k.array mandel.k.ilab
### Keywords: univar

### ** Examples

	data(RMstudy)

	#Data frame examples: note no secondary grouping factor
	h <- with(RMstudy, mandel.k(RMstudy[2:9], g=Lab))
	plot(h, las=2)

	#Vector variant
	RMstk <- stack(RMstudy[,2:9])
	names(RMstk) <- c("x", "meas")
		#names replace 'values' and 'ind'
	RMstk$Lab <- rep(RMstudy$Lab, 8)
	h2 <- with(RMstk, mandel.k(x, g=Lab, m=meas, rowname="Laboratory"))
		#Note use of rowname to override g
	plot(h2, las=2)
	
	#ilab method
	RM.ilab <- with(RMstk, construct.ilab(org=Lab, x=x, measurand=meas, 
		item=factor(rep("CRM", nrow(RMstk))) ) )

	plot(mandel.k(RM.ilab))
	
	#Robust variant
	krob <- with(RMstudy, mandel.kh(RMstudy[2:9], g=Lab, type="k", method="robust"))
	plot(krob, las=2)



