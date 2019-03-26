## ---- eval=FALSE---------------------------------------------------------
#  install.packages("MLID")

## ---- eval=FALSE---------------------------------------------------------
#  # Needs devtools. Use: install.packages("devtools")
#  require(devtools)
#  devtools::install_github("profrichharris/MLID")

## ---- eval=FALSE---------------------------------------------------------
#  require(MLID)

## ---- eval=FALSE---------------------------------------------------------
#  checkerboard()

## ---- echo = F-----------------------------------------------------------
x <- c(rep(c(1,0), times=8), rep(c(0,1), times=8))
x <- matrix(x, nrow=16, ncol=16)
y <- abs(1-x)

n <- length(x)
dd <- dim(x)
rows <- 1:dd[1]
cols <- 1:dd[2]
grd <- expand.grid(cols, rows)
r2 <- ceiling(grd/2)
ID2 <- paste("A",r2$Var1,"-",r2$Var2, sep="")
r4 <- ceiling(grd/4)
ID4 <- paste("B",r4$Var1,"-",r4$Var2, sep="")
r8 <- ceiling(grd/8)
ID8 <- paste("C",r8$Var1,"-",r8$Var2, sep="")
gridcodes <- data.frame(ID=1:n, TwoBy2 = ID2, FourBy4 = ID4, EightBy8 = ID8)

grd <- raster::raster(x)
print(sp::spplot(grd, colorkey = FALSE,
                 col.regions = colorRampPalette(c("white", "black"))))


x <- rep(c(1,1,0,0), times=8)
x <- c(x, rep(c(0,0,1,1), times=8))
x <- matrix(x, nrow=16, ncol=16)
x[min(which(x==0))] <- 1
y <- abs(1-x)

grd <- raster::raster(x)
print(sp::spplot(grd, colorkey=FALSE,
                 col.regions = colorRampPalette(c("white", "black")),
                 border = "grey"))


x <- rep(c(1,1,1,1,0,0,0,0), times=8)
x <- c(x, rep(c(0,0,0,0,1,1,1,1), times=8))
x <- matrix(x, nrow=16, ncol=16)
x[min(which(x==0))] <- 1
y <- abs(1-x)

grd <- raster::raster(x)
print(sp::spplot(grd, colorkey = FALSE,
                 col.regions = colorRampPalette(c("white", "black")),
                 border = "grey"))


x <- rep(c(rep(1,8),rep(0,8)), times=8)
x <- c(x, rep(c(rep(0,8),rep(1,8)), times=8))
x <- matrix(x, nrow=16, ncol=16)
x[min(which(x==0))] <- 1
y <- abs(1-x)

grd <- raster::raster(x)
print(sp::spplot(grd, colorkey = FALSE,
                 col.regions = colorRampPalette(c("white", "black")),
                 border = "grey"))

## ---- include=FALSE------------------------------------------------------
require(MLID)

## ------------------------------------------------------------------------
data(ethnicities)

## ------------------------------------------------------------------------
head(ethnicities, n = 3)

## ------------------------------------------------------------------------
index <- id(ethnicities, vars = c("Bangladeshi", "WhiteBrit"))
index

## ------------------------------------------------------------------------
impx <- impacts(ethnicities, c("Bangladeshi", "WhiteBrit"), c("LAD","RGN"))
head(impx, n = 3)

## ---- include=FALSE------------------------------------------------------
twrh <- impx$LAD
twrh <- twrh[row.names(twrh) == "Tower Hamlets",]

## ---- eval=FALSE---------------------------------------------------------
#  head(ethnicities)

## ------------------------------------------------------------------------
index <- id(ethnicities, vars = c("Bangladeshi", "WhiteBrit", "Persons"), expected = TRUE)
index

## ------------------------------------------------------------------------
head(ethnicities, n = 1)

## ------------------------------------------------------------------------
aggdata <- sumup(ethnicities, sumby = "LSOA", drop = "OA")
head(aggdata, n = 3)
index <- id(aggdata, vars = c("Bangladeshi", "WhiteBrit", "Persons"), expected = TRUE)
index

## ------------------------------------------------------------------------
head(impacts(aggdata, vars = c("Bangladeshi", "WhiteBrit"), levels = c("LAD", "RGN")), n = 3)

## ------------------------------------------------------------------------
index <- id(aggdata, vars = c("Bangladeshi", "WhiteBrit"), levels = c("MSOA","LAD","RGN"))
index

## ------------------------------------------------------------------------
ci <- confint(index)
catplot(ci, grid = FALSE)

## ------------------------------------------------------------------------
prd <- effect(index, places = c("Tower Hamlets", "Newham"))
prd

## ------------------------------------------------------------------------
effect(index, places = c("Tower Hamlets", "Newham", "E02001113"))

## ------------------------------------------------------------------------
aggdata[aggdata$MSOA == "E02001113",]

## ------------------------------------------------------------------------
newindex <- id(aggdata, vars = c("Bangladeshi", "WhiteBrit"), levels = c("MSOA","LAD","RGN"), omit = c("Tower Hamlets", "Newham", "E02001113"))
newindex

## ------------------------------------------------------------------------
attr(index, "variance")

## ------------------------------------------------------------------------
attr(newindex, "variance")

## ------------------------------------------------------------------------
attr(newindex, "variance") - attr(index, "variance")

