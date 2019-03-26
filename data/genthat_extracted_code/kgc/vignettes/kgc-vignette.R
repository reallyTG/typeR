## ---- message=FALSE, warning=FALSE---------------------------------------
library("kgc")
data <- data.frame(site = c("GC","UFS","NEG"), zip = c(44106, 96701, 80019))
data <- data.frame(TranslateZipCode(data))
data
data <- data.frame(data, rndCoord.lat = RoundCoordinates(data$Latitude), rndCoord.lon = RoundCoordinates(data$Longitude))
data
data <- data.frame(data,ClimateZ=LookupCZ(data))
data
data <- data.frame(data, CZUncertainty(data))
data
rename(data, c("rndCoord.lat" = "rounded lat", "rndCoord.lon" = "rounded long", "ClimateZ" =  "predicted KG-CZ", "possible.cz"="possible KG-CZ"))

