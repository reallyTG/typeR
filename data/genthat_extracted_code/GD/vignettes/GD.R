## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library("GD")
data("ndvi_40")
head(ndvi_40)[1:3,]

## ---- eval = FALSE-------------------------------------------------------
#  ## discretization methods: equal, natural, quantile (default), geometric, sd and manual
#  ds1 <- disc(ndvi_40$Tempchange, 4)
#  ds1
#  plot(ds1)

## ---- eval = FALSE-------------------------------------------------------
#  ## set optional discretization methods and numbers of intervals
#  discmethod <- c("equal","natural","quantile","geometric","sd")
#  discitv <- c(3:7)
#  ## optimal discretization
#  odc1 <- optidisc(continuous_variable = ndvi_40$Tempchange,
#                   response_variable = ndvi_40$NDVIchange,
#                   discmethod, discitv)
#  odc1
#  plot(odc1)

## ---- eval = FALSE-------------------------------------------------------
#  ## NDVI: ndvi_40
#  ## define elements orders of categorical variables
#  cz <- c("Bwk","Bsk","Dwa","Dwb","Dwc") ## climate zone
#  mp <- c("very low","low","medium","high","very high") ## mining production
#  ndvi_40$Climatezone <- as.numeric(1:5)[match(ndvi_40$Climatezone, cz)]
#  ndvi_40$Mining <- as.numeric(1:5)[match(ndvi_40$Mining, mp)]
#  ## set optional parameters of optimal discretization
#  ## optional methods: equal, natural, quantile, geometric, sd and manual
#  discmethod <- c("equal","natural","quantile")
#  discitv <- c(4:6)
#  ## "gdm" function
#  ndvigdm <- gdm(NDVIchange ~ Climatezone + Mining + Tempchange + GDP,
#                 continuous_variable = c("Tempchange", "GDP"),
#                 data = ndvi_40,
#                 discmethod = discmethod, discitv = discitv)
#  ndvigdm
#  plot(ndvigdm)
#  
#  ## H1N1: h1n1_100
#  ## set optional parameters of optimal discretization
#  discmethod <- c("equal","natural","quantile","geometric","sd")
#  discitv <- c(3:7)
#  continuous_variable <- colnames(h1n1_100)[-c(1,11)]
#  ## "gdm" function
#  h1n1gdm <- gdm(H1N1 ~ .,
#                 continuous_variable = continuous_variable,
#                 data = h1n1_100,
#                 discmethod = discmethod, discitv = discitv)
#  h1n1gdm
#  plot(h1n1gdm)

## ---- eval = FALSE-------------------------------------------------------
#  ## a categorical explanatory variable
#  g1 <- gd(NDVIchange ~ Climatezone, data = ndvi_40)
#  g1
#  
#  ## multiple categorical explanatory variables
#  g2 <- gd(NDVIchange ~ ., data = ndvi_40[,1:3])
#  g2
#  plot(g2)
#  
#  ## multiple variables inclusing continuous variables
#  discmethod <- c("equal","natural","quantile","geometric","sd")
#  discitv <- c(3:7)
#  data_ndvi <- ndvi_40
#  odc1 <- optidisc(continuous_variable = data_ndvi[,4:7],
#                   response_variable = data_ndvi$NDVIchange,
#                   discmethod, discitv)
#  for (i in 4:7){
#    data_ndvi[,i] <- stra(data_ndvi[,i], odc1[[i-3]]$itv)
#  }
#  g3 <- gd(NDVIchange ~ ., data = data_ndvi)
#  g3
#  plot(g3)

## ---- eval = FALSE-------------------------------------------------------
#  ## categorical explanatory variables
#  rm1 <- riskmean(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
#  rm1
#  plot(rm1)
#  ## multiple variables inclusing continuous variables
#  rm3 <- riskmean(NDVIchange ~ ., data = data_ndvi)
#  rm3
#  plot(rm3)

## ---- eval = FALSE-------------------------------------------------------
#  ## categorical explanatory variables
#  gr1 <- gdrisk(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
#  gr1
#  plot(gr1)
#  ## multiple variables inclusing continuous variables
#  gd3 <- gdrisk(NDVIchange ~ ., data = data_ndvi)
#  gd3
#  plot(gd3)

## ---- eval = FALSE-------------------------------------------------------
#  ## categorical explanatory variables
#  gi1 <- gdinteract(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
#  gi1
#  ## multiple variables inclusing continuous variables
#  gi3 <- gdinteract(NDVIchange ~ ., data = data_ndvi)
#  gi3
#  plot(gi3)

## ---- eval = FALSE-------------------------------------------------------
#  ## categorical explanatory variables
#  ge1 <- gdeco(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
#  ge1
#  ## multiple variables inclusing continuous variables
#  gd3 <- gdeco(NDVIchange ~ ., data = data_ndvi)
#  gd3
#  plot(gd3)

## ---- eval = FALSE-------------------------------------------------------
#  ndvilist <- list(ndvi_10, ndvi_20, ndvi_30, ndvi_40, ndvi_50)
#  su <- c(10,20,30,40,50) ## sizes of spatial units
#  gdlist <- list() ## list of all geographical detectors results
#  ## set optional parameters of optimal discretization
#  discmethod <- c("equal","natural","quantile","geometric","sd")
#  discitv <- c(3:7)
#  ## "gdm" function (~ 40s)
#  for (i in 1:length(su)){
#    ndvidata <- ndvilist[[i]]
#    gdlist[[i]] <- gdm(NDVIchange ~ .,
#                       continuous_variable = c("Tempchange", "Precipitation", "GDP", "Popdensity"),
#                       data = ndvidata,
#                       discmethod = discmethod, discitv = discitv)
#  }
#  ## size effects of spatial units
#  sesu(gdlist, su)

