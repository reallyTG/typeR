library(agridat)


### Name: mercer.wheat.uniformity
### Title: Uniformity trial of wheat
### Aliases: mercer.wheat.uniformity

### ** Examples


data(mercer.wheat.uniformity)
dat <- mercer.wheat.uniformity

if(require(desplot)){
  desplot(grain ~ col*row, dat,
          aspect=216/200, # true aspect
          main="mercer.wheat.uniformity - grain yield")
}


require("lattice")
xyplot(straw ~ grain, data=dat, type=c('p','r'),
       main="mercer.wheat.uniformity - regression")

## Not run: 
##D   require(hexbin)
##D   hexbinplot(straw ~ grain, data=dat)
## End(Not run)

if(require(sp) & require(gstat)) { 
  plot.wid <- 2.5
  plot.len <- 3.2
  nr <- length(unique(dat$row))
  nc <- length(unique(dat$col))

  xy <- expand.grid(x = seq(plot.wid/2, by=plot.wid, length=nc),
                    y = seq(plot.len/2, by=plot.len, length=nr))
  dat.sp <- dat
  coordinates(dat.sp) <- xy

  # heatmap
  spplot(dat.sp, zcol = "grain", cuts=8,
         cex = 1.6,
         col.regions =  bpy.colors(8),
         main = "Grain yield", key.space = "right")
  
  # variogram
  vg <- variogram(grain ~ 1, dat.sp, cutoff = plot.wid * 10, width = plot.wid)
  plot(vg, plot.numbers = TRUE,
       main="mercer.wheat.uniformity - variogram")
}




