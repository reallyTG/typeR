## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----config, echo=TRUE---------------------------------------------------

	library(VFS)
	data(soildat)
	data(bufferdat)

	# basic required parameters
	nyears <- 3
	FieldArea <- 4000
	FieldSlope <- 0.05
	VFSslope <- 0.02
	VFSwidth <- 15
	soilP <- 120 
	soilOM <- 2

## ----weathgen, echo=TRUE-------------------------------------------------
	# State College, PA GHCN data
	data("weather") 
	weather.param <- wth.param(weather, method="markov")

	rainfallSC <- rainfall(365*nyears, weather.param)
	temperatureSC <- temperature(365*nyears, weather.param)

## ----weathergenfig, fig.cap="State College, PA, simulated daily weather", echo=FALSE, fig.show="hold", width=6, height=6----
	temp.mai <- par()$mai
	temp.mai[3] <- 0.1
	par(mai = temp.mai)

	barplot(rainfallSC, col="blue", ylab="Rainfall (mm)", xlab="Day")
	plot(temperatureSC, col="red", ylab="Temperature (C)", type="l", xaxt="n")
	axis(1, at=(0:2 * 365), labels=paste("Yr", 1:3))

## ----vfs, echo=TRUE------------------------------------------------------
	# bluegrass filter strip
	vfsSC <- lapply(seq_len(nrow(soildat)), function(i)
		VFS(nyears=nyears, thissoil=soildat[i,],
		thisbuffer=subset(bufferdat, Species == "bluegrass"), 
		rain=rainfallSC, temperature=temperatureSC, FieldArea=FieldArea,
		VFSwidth=VFSwidth, VFSslope=VFSslope, FieldSlope=FieldSlope, b=1.5))
	names(vfsSC) <- soildat$Soil

	vfsSC.summary <- data.frame(t(sapply(vfsSC, summary)))

## ----VFSfig, fig.cap="VFS efficacy at sediment removal by soil texture", echo=FALSE, fig.show="hold", width=7, height=6----
	temp.mai <- par()$mai
	temp.mai[3] <- 0.1
	par(mai = temp.mai)

	plot(c(100, 600), c(0, 100), type="n", xlab="Annual runoff (mm)", ylab="TLR (%)", xlim=c(100, 600), ylim=c(0, 100))
	with(vfsSC.summary, points(Runoff, TLR, col="darkgreen", pch=0))

	
	with(vfsSC.summary, text(Runoff, TLR - 5, row.names(vfsSC.summary), cex=.5))

## ----APLE1, echo=TRUE----------------------------------------------------
	apleSC <- lapply(vfsSC, function(x)VFSAPLE(x, soilP=soilP, OM=soilOM))
	names(apleSC) <- soildat$Soil

	apleSC.summary <- data.frame(t(sapply(apleSC, summary)))

## ----APLEfig, fig.cap="VFS efficacy at removing phosphorus", echo=FALSE, fig.show="hold", width=7, height=6----
	temp.mai <- par()$mai
	temp.mai[3] <- 0.1
	par(mai = temp.mai)

	plot(c(0, 100), c(0, 100), type="n", xlab="Sediment removed (%)", ylab="Phosphorus removed (%)", xlim=c(0, 100), ylim=c(0, 100))
	points(vfsSC.summary$MUSLETLR, apleSC.summary$AnnualErosionPRemoval, pch=0, col="darkgreen", cex=1.5)
	abline(c(0,1), lty=2, col="gray")

	points(vfsSC.summary$MUSLETLR, apleSC.summary$AnnualTotalPRemoval, pch=15, col="darkgreen", cex=1.5)

	text(vfsSC.summary$MUSLETLR, apleSC.summary$AnnualTotalPRemoval-6, row.names(vfsSC.summary), cex=.5)

	legend("topleft", pch=c(0, 15), col="darkgreen", legend=c("Erosion P", "Total P"))

