## ---- eval = FALSE-------------------------------------------------------
#  data(caneToad.counts)
#  data(caneToad.groups)
#  counts <- as.data.frame(t(caneToad.counts))
#  x <- ALDEx2::aldex.clr(counts, caneToad.groups, denom = "iqlr")
#  rho <- propr::aldex2propr(x, how = "rho")

## ---- eval = FALSE-------------------------------------------------------
#  rho <- propr(caneToad.counts, metric = "rho", ivar = "iqlr")

## ---- eval = FALSE-------------------------------------------------------
#  data(caneToad.counts)
#  rho <- perb(caneToad.counts)
#  autoprop <- rho[">", .995]@pairs
#  highprop <- rho[">", .95]@pairs
#  rho@pairs <- setdiff(highprop, autoprop)

## ---- eval = FALSE-------------------------------------------------------
#  data(caneToad.counts)
#  prop <- new("propr", counts = caneToad.counts, ivar = "iqlr")
#  prop@logratio

