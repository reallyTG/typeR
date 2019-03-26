## ----message=FALSE-------------------------------------------------------
library(lctools)
data(GR.Municipalities)
names(GR.Municipalities@data)

## ------------------------------------------------------------------------
Coords <- cbind(GR.Municipalities@data$X, GR.Municipalities@data$Y)
bw <- 6
mI <- moransI(Coords,bw,GR.Municipalities@data$Income01)
moran.table <- matrix(data=NA,nrow=1,ncol=6)
col.names <- c("Moran's I", "Expected I", "Z resampling", "P-value resampling",
               "Z randomization", "P-value randomization")
colnames(moran.table) <- col.names
moran.table[1,1] <- mI$Morans.I
moran.table[1,2] <- mI$Expected.I
moran.table[1,3] <- mI$z.resampling
moran.table[1,4] <- mI$p.value.resampling
moran.table[1,5] <- mI$z.randomization
moran.table[1,6] <- mI$p.value.randomization

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(round(moran.table,5))

## ------------------------------------------------------------------------
#adaptive kernel
w.adaptive <- w.matrix(Coords,6, WType='Binary', family='adaptive')

mI.adaptive <- moransI.w(GR.Municipalities@data$Income01, w.adaptive)
mI.adaptive <- t(as.numeric(as.matrix(mI.adaptive[1:6])))
colnames(mI.adaptive) <- col.names

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(round(mI.adaptive,5))

## ------------------------------------------------------------------------
#fixed kernel
w.fixed <- w.matrix(Coords, 50000, WType='Binary', family='fixed')

mI.fixed<- moransI.w(GR.Municipalities@data$Income01, w.fixed)
mI.fixed <- t(as.numeric(as.matrix(mI.fixed[1:6])))

colnames(mI.fixed) <- col.names


## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(round(mI.fixed ,5))

## ----fig.width = 5, fig.height = 5---------------------------------------
bws <- c(3, 4, 6, 9, 12, 18, 24)
moran <- moransI.v(Coords, bws, GR.Municipalities@data$Income01)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(round(moran,4))

## ----fig.width = 5, fig.height = 5---------------------------------------
l.moran<-l.moransI(Coords,6,GR.Municipalities@data$Income01)

