library(SwissAir)


### Name: AirQual
### Title: Air Quality Data of Switzerland
### Aliases: AirQual SwissAir
### Keywords: datasets

### ** Examples

str(AirQual)
sapply(AirQual, function(x) sum(is.na(x)))
cbind(min = sapply(AirQual[,-1], min, na.rm = TRUE),
      median = sapply(AirQual[,-1], median, na.rm = TRUE),
      max = sapply(AirQual[,-1], max, na.rm = TRUE))

if (require(IDPmisc) && require(grid)) {

  ## low correlation, density on logarithmic scale
  ipairs(AirQual[,c("ad.O3","lu.O3","sz.O3")],
         ztrans = function(x){x[x<1] <- 1; log2(x)*10})

  ## Not run: 
##D   ipairs(AirQual[,c("ad.NOx","lu.NOx","sz.NOx")],
##D          ztrans = function(x){x[x<1] <- 1; log2(x)*10})
## End(Not run)

  lags <- c(1, 2, 4, 8)
  ilagplot(AirQual[,c("ad.O3")], set.lags = lags,
         ztrans = function(x){x[x<1] <- 1; log2(x)*10})

  Ox <- AirQual[,c("lu.O3","sz.O3")]+
        AirQual[,c("lu.NOx","sz.NOx")]-
        AirQual[,c("lu.NO","sz.NO")]
  names(Ox) <- c("lu","sz")

  ## high correlation, density on logarithmic scale
  ipairs(Ox,
         ztrans = function(x){x[x<1] <- 1; log2(x)*10})
  ilagplot(Ox$lu, set.lags = lags,
         ztrans = function(x){x[x<1] <- 1; log2(x)*10})

  dat <-
      data.frame(month =as.numeric(substr(AirQual$start,4,5)),
                 hour = as.numeric(substr(AirQual$start,12,13)),
                 WD = AirQual$ad.WD,
                 NOx = AirQual$ad.NOx,
                 O3  = AirQual$ad.O3,
                 Ox  = AirQual$ad.O3+AirQual$ad.NOx-AirQual$ad.NO)

  med.dayrose <- rose(dat[,c("NOx","O3","Ox")],
                      subset = dat$month > 4 & dat$month < 10,
                      cyclVar =dat$hour, n.cyclVar = 24, circle = 24,
                      FUN = median, na.rm = TRUE)

  ## NOx (= NO+NO2) and ozone (O3) have a distinct diurnal variation of
  ## concentration, whereas Ox (= NO2+O3) varies only very slightly
  grid.newpage()
  plot(med.dayrose,
       general = general.control(lwd=2),
       grid =
       grid.control(ray.n = 12,
                    circ.n = 2,
                    circ.sub.n = 2,
                    cyclVar.lab = seq(0,by = 2,to = 22)),
       title =
           title.control(text = "Day Rose of Medians\nduring summer time"))
  grid.newpage()
  plot(med.dayrose,
       general = general.control(lwd = 3),
       grid =
           grid.control(ray.n = 12,
                        circ.n = 2,
                        circ.sub.n = 2,
                        cyclVar.lab = seq(0, by = 2, to = 22)),
       title =
           title.control(text = "Day Rose of Medians\nduring summer time"))

  ## exploration of upslope (North) downslope (South) wind system
  ## during summer time in the valley north of Gotthard
  ncol <- 3

  grid.newpage()
  pushViewport(viewport(layout = grid.layout(nrow = 3, ncol = ncol),
                        width = 0.98, height = 0.98))

  for (hour in seq(0, 21, 3)) {
    windrose <-
      rose(dat$WD, cyclVar = dat$WD, circle = 360, n.cyclVar = 32,
           subset = dat$hour >= hour & dat$hour < hour+2 &
                    dat$month > 4 & dat$month < 10,
           FUN = function(x) sum(!is.na(x)),
           warn = FALSE)

    pushViewport(viewport(layout.pos.col = (hour/3)%%ncol+1,
                          layout.pos.row = (hour/3)%/%ncol+1))
    pushViewport(viewport(width = 0.9, height = 0.9))
    plot(windrose,
         general =
             general.control(lwd = 3),
         grid =
             grid.control(circ.r = seq(0, 150, 50),
                          circ.sub.r = seq(25, 150, 25),
                          circ.between = -0.2,
                          circ.cex = 0.5,
                          cyclVar.cex = 0.8,
                          ray.lim = c(0, 150)),
         title = title.control(
             text = paste(hour, "-", hour+3),
             between = 0.3, cex = 1.2))
    popViewport(n = 2)
} ## end for
} else print("Package IDPmisc is not available")



