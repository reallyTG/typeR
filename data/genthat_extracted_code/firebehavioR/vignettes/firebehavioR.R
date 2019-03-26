## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("EcoFire/firebehavioR")

## ----message=FALSE, warning=FALSE----------------------------------------
library("firebehavioR")

## ------------------------------------------------------------------------
data("coForest")
print(coForest)

## ------------------------------------------------------------------------
ex1 = cfis(fsg = coForest$cbh_m, u10 = 20, effm = 6, sfc = coForest$sfl_kgm2 * 10, 
    cbd = coForest$cbd_kgm3, id = 1)
print(ex1)

## ------------------------------------------------------------------------
ex2 = aggregate(x = ex1$cROS, by = list(treatmentStatus = coForest$status), FUN = mean)
print(ex2)

## ------------------------------------------------------------------------
ex3 = coForest[rep(seq_len(nrow(coForest)), 11), ]
ex3$u10 = sort(rep(10:20, 14))
head(ex3)

ex3$type = cfis(ex3$cbh_m, ex3$u10, 6, ex3$sfl_kgm2 * 10, ex3$cbd_kgm3, 1)$type
table(u10 = ex3$u10, ex3$type, ex3$status)

## ------------------------------------------------------------------------
ex4 = cfis(coForest[1, ]$cbh_m, u10 = 14, effm = 6, sfc = coForest[1, ]$sfl_kgm2, 
    cbd = coForest[1, ]$cbd_kgm3, id = 0:10)
ex4$id = 0:10

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Requisite conditions for successful spot fire ignition given the projected crown fire rate of spread."----
library("ggplot2")

ggplot(ex4, aes(sepDist, id)) + geom_ribbon(aes(ymin = pmin(sepDist, id), ymax = 0), 
    fill = "red", col = "red", alpha = 0.5) + geom_line(size = 1.5) + labs(x = "Critical seperation distance (m)", 
    y = "Ignition delay (min)") + annotate("text", x = 450, y = 3, label = "Spot fire ignition zone") + 
    theme_classic()

## ------------------------------------------------------------------------
data(fuelModels, fuelMoisture)

fuelModels['A10',]
exampSurfFuel = fuelModels['A10',]

fuelMoisture['D1L1',]
exampFuelMoisture = fuelMoisture['D1L1',]

exampCrownFuel = data.frame(
  CBD = coForest$cbd_kgm3,
  FMC = 100,
  CBH = coForest$cbh_m,
  CFL = coForest$cfl_kgm2
)

exampEnviro = data.frame(
  slope = 10,
  windspeed = 40,
  direction = 0,
  waf = 0.2
)
exampSurfFuel = sapply(exampSurfFuel, rep, 14)
exampFuelMoisture = sapply(exampFuelMoisture, rep, 14)
exampEnviro = sapply(exampEnviro,rep,14)
ex5 = rothermel(exampSurfFuel, exampFuelMoisture, exampCrownFuel, exampEnviro)

## ------------------------------------------------------------------------
head(ex5$fireBehavior)

## ------------------------------------------------------------------------
head(ex5$detailSurface)
head(ex5$detailCrown)

## ------------------------------------------------------------------------
head(ex5$critInit)
head(ex5$critActive)
head(ex5$critCess)

## ------------------------------------------------------------------------
exampEnviro = data.frame(
  slope = 30,
  windspeed = 60,
  direction = 0,
  waf = 0.2
)

exampCrownFuel = data.frame(
  CBD = truncnorm::rtruncnorm(1000, a=0, coForest$cbd_kgm3[1], sd = coForest$cbd_kgm3[1]*.2),
  FMC = rep(100,1000),
  CBH = truncnorm::rtruncnorm(1000, a=0, coForest$cbh_m[1], sd = coForest$cbh_m[1]*.2),
  CFL = truncnorm::rtruncnorm(1000, a=0, coForest$cfl_kgm2[1], sd = coForest$cfl_kgm2[1]*.2)
)

ex6 = rep(NA,200)
for (i in 1:200){
  ex6[i] = rothermel(exampSurfFuel[1,], exampFuelMoisture[1,], exampCrownFuel[i,], exampEnviro, cfbForm = "sr")$fireBehavior[,3]  
}

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Effect of uncetain canopy fuels on predicted rate of spread."----
ggplot(data.frame(ex6), aes(ex6)) + geom_density(fill='blue',alpha = 0.5,adjust = 1/5) + 
    xlab("Rate of spread (m/s)") + theme_classic() + coord_cartesian(expand=FALSE)

## ------------------------------------------------------------------------
fuelModels['A5',]
exampSurfFuel = fuelModels['A5',]

fuelMoisture['D1L1',]
exampFuelMoisture = fuelMoisture['D1L1',]

exampCrownFuel = data.frame(
  CBD = Inf,  FMC = 100,
  CBH = Inf,  CFL = Inf
)

exampEnviro = data.frame(
  slope = 40,  windspeed = 60,
  direction = 0, waf = 0.3
)

ex7 = expand.grid(winddir=seq(-180,180,10),slope = seq(0,30,5))
ex7$ros = NA
for (i in 1:259){
  exampEnviro$direction = ex7$winddir[i]
  exampEnviro$slope     = ex7$slope[i]
  ex7$ros[i] = rothermel(exampSurfFuel, exampFuelMoisture, exampCrownFuel, exampEnviro)$fireBehavior[,3]  
}

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Distribution of hourly fuel moistures predicted by three methods using `ffm()`."----
ggplot(ex7,aes(winddir,ros,color=slope,group=slope)) +geom_path() + theme_classic() + labs(x='Wind direction (deg)',y='Rate of spread (m/s)')

## ------------------------------------------------------------------------
ba = c(10, 15)
ht = c(12, 20)
tph = c(100, 300)
type = c("df", "pp", "mc","lp")
cbind(type,canFuel(ba, ht, tph, type))


## ------------------------------------------------------------------------
data(rrRAWS)
print(head(rrRAWS))

ff = rbind(
data.frame(ffm = ffm("simard",rrRAWS$rh, rrRAWS$temp_c)$fm1hr,method="simard"),
data.frame(ffm = ffm("wagner",rrRAWS$rh, rrRAWS$temp_c)$fm1hr,method="wagner"),
data.frame(ffm = ffm("anderson",rrRAWS$rh, rrRAWS$temp_c)$fm1hr,method="anderson")
)
ff$dateTime = rep(rrRAWS$dateTime,3)

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Distribution of hourly fuel moistures predicted by three methods using `ffm()`."----
ggplot(ff, aes(ffm, color = method, fill = method)) + geom_density(alpha = 0.5) + 
    xlab("Fine fuel moisture (%)") + theme_classic()

## ------------------------------------------------------------------------
rrRAWS_ma = subset(rrRAWS, rh <= 70 & temp_c >= 10 & rh > 42.5 - 1.25 * temp_c & 
    rh < 94.5 - 1.35 * temp_c)
ff.ma = data.frame(ffm = ffm("mcarthur", rrRAWS_ma$rh, rrRAWS_ma$temp_c)$fm1hr, method = "mcarthur", 
    dateTime = rrRAWS_ma$dateTime)
ff = rbind(data.frame(ffm = ffm("simard", rrRAWS$rh, rrRAWS$temp_c)$fm1hr, method = "simard"), 
    data.frame(ffm = ffm("wagner", rrRAWS$rh, rrRAWS$temp_c)$fm1hr, method = "wagner"), 
    data.frame(ffm = ffm("anderson", rrRAWS$rh, rrRAWS$temp_c)$fm1hr, method = "anderson"))
ff$dateTime = rep(rrRAWS$dateTime, 3)
ff = rbind(ff, ff.ma)
ff$dateTime <- strptime(ff$dateTime, "%m/%d/%Y %H:%M")
ff$dateTime <- as.POSIXct(ff$dateTime)

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Hourly fuel moistures predicted by four methods using `ffm()`"----
ffm.plot = ggplot(ff, aes(x = dateTime, y = ffm, color = method)) + geom_smooth(span = 0.1, 
    method = "loess", se = F) + theme_classic() + labs(x = "Time", y = "Fuel moisture (%)")
print(ffm.plot)

## ------------------------------------------------------------------------
rh = rrRAWS$rh
temp = rrRAWS$temp_c
month = as.numeric(format(strptime(rrRAWS$dateTime, "%m/%d/%Y %H:%M"), "%m"))
hour = as.numeric(format(strptime(rrRAWS$dateTime, "%m/%d/%Y %H:%M"), "%H"))
ff.fbo = data.frame(ffm = ffm(method = "fbo", rh, temp, month, hour, asp = "N", slp = 10, 
    bla = "l", shade = "n")$fm1hr, method = "FBO", dateTime = strptime(rrRAWS$dateTime, 
    "%m/%d/%Y %H:%M"))
ff = rbind(ff, ff.fbo)

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Hourly fuel moistures predicted by `method = 'fbo'`, in blue, relative to other methods, in grayscale."----
ffm.plot + scale_colour_grey() + geom_smooth(data = ff.fbo, aes(x = dateTime, y = ffm), 
    span = 0.1, method = "loess", se = F, color = "blue") + guides(color = FALSE) + 
    labs(x = "Time", y = "Fuel moisture (%)")

## ------------------------------------------------------------------------
waf(forestHt = 10, cr = 40, cc = 40)

## ------------------------------------------------------------------------
waf(forestHt = 10, sheltered = "y")

## ------------------------------------------------------------------------
waf(fuelDepth = 1)

## ------------------------------------------------------------------------
waf(fuelDepth = 1, forestHt = 10, cr = 10, cc = 10)

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Fire characteristics chart", warning = FALSE----
fireChart("Valley Fire",1000,50) +xlim(0,12000)


## ------------------------------------------------------------------------
rrRAWS.daily =   rrRAWS[format(strptime(rrRAWS$dateTime, "%m/%d/%Y %H:%M"), "%H:%M")=="14:35",]
indices = fireIndex(temp=rrRAWS.daily$temp_c, u= rrRAWS.daily$windSpeed_kmh, rh = rrRAWS.daily$rh)
normalize=function(x,low=0,high=1){low+(x-min(x,na.rm=T))*(high-low)/(max(x,na.rm=T)-min(x,na.rm=T))}
indices = data.frame(sapply(indices,normalize),  Date = strptime(rrRAWS.daily$dateTime, "%m/%d/%Y %H:%M"))
indices = setNames(reshape2::melt(indices,id="Date"),c("Date","Index","Value"))


## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Continuous fire index values applied to `data(rrRAWS)`.",warning = FALSE----
ggplot(indices,aes(Date,Value,group=Index,color=Index))+geom_smooth(span = .1,  method = "loess", se = F) +theme_classic()+coord_cartesian(expand=F)

## ------------------------------------------------------------------------
data(rrRAWS)
daily.precip = rrRAWS
daily.precip$Date = strptime(daily.precip$dateTime, "%m/%d/%Y")
daily.precip = setNames(aggregate(daily.precip$precip_mm, by = list(as.character(daily.precip$Date)), 
    FUN = sum), c("Date", "DailyPrecip"))
rrRAWS.daily = rrRAWS[format(strptime(rrRAWS$dateTime, "%m/%d/%Y %H:%M"), "%H:%M") == 
    "14:35", ]
rrRAWS.daily$DailyPrecip = daily.precip$DailyPrecip
indices = fireIndexKBDI(temp = rrRAWS.daily$temp_c, precip = rrRAWS.daily$DailyPrecip, 
    map = 610, rh = rrRAWS.daily$rh, u = rrRAWS.daily$windSpeed_kmh)
indices = data.frame(sapply(indices,normalize), Date = strptime(rrRAWS.daily$dateTime, 
    "%m/%d/%Y %H:%M"))
indices = setNames(reshape2::melt(indices, id = "Date"), c("Date", "Index", "Value"))

## ----fig.height = 3, fig.width = 7, fig.align = "center", fig.cap = "Static fire index values applied to `data(rrRAWS)`.",warning = FALSE----
ggplot(indices, aes(Date, Value, group = Index, color = Index)) + geom_smooth(span = 0.1, 
    method = "loess", se = F) + theme_classic() + coord_cartesian(expand = F)

## ---- echo=FALSE, results="asis"-----------------------------------------
table = xtable::xtable(data.frame(Method = c("KBDI", "Drought factor", "Forest Mark 5", 
    "Fosberg-KBDI", "Fuel moisture-KBDI", "Nesterov", "Nesterov-Modified", "Zdenko"), 
    Inputs = c("temp, precip, map", "temp, precip, map", "temp, precip, map, u, rh", 
        "temp, precip, map, u, rh", "temp, precip, map, u, rh", "temp, precip, rh", 
        "temp, precip, rh", "temp, precip, rh")))
print(table, type = "html", sanitize.text.function = identity)

## ---- echo=FALSE, results="asis"-----------------------------------------
table = xtable::xtable(data.frame(Variable = c("Fuel stratum gap", "10-m Open wind speed", 
    "Fuel moisture content", "Canopy bulk density", "Seperation distance", "Basal area", 
    "Average stand tree heights", "Trees per hectare", "Relative humidity", "Temperature", 
    "Month", "Hour", "Topographic aspect", "Topographic slope", "Heat per unit area", 
    "Fire rate of spread", "surface fuel load", "Surface area to volume", "Fuelbed depth", 
    "Moisture of extinction", "Heat content", "Canopy fuel load", "Wind direction", 
    "Wind adjustment factor", "Crown ratio", "Canopy cover"), Units = c("m", "km/hr", 
    "%", "kg/m^3^", "m", "m^2^/ha", "m", "trees/ha", "%", "degrees C", "Month of the year (1-12)", 
    "Hour of day (1-24)", "N,S,W, or E", "%", "kJ/m^2^", "m/min", "Mg/ha", "m^2/^m^3^", 
    "cm", "%", "J/g", "kg/m^2^", "0-360", "Ratio of 20-ft open wind speed to midflame wind speed", 
    "%", "%")))
print(table, type = "html", sanitize.text.function = identity)

