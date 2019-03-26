library(M3)


### Name: get.M3.var
### Title: Read in variable values from Models3-formatted files
### Aliases: get.M3.var
### Keywords: IO

### ** Examples

## Find the path to the first demo file (with polar
## stereographic projection).
polar.file <- system.file("extdata/surfinfo_polar.ncf", package="M3")

## Read in the terrain elevation variable.
elev <- get.M3.var(file=polar.file, var="HT")
## Make a plot.
image(elev$x.cell.ctr, elev$y.cell.ctr, elev$data[,,1],
      xlab="Projection x-coord (km)", ylab="Projection y-coord (km)",
      zlim=range(elev$data[,,1]), col=topo.colors(20))
## Find national boundaries on this projection, superimpose them on
## the plot.
world.bds <- get.map.lines.M3.proj(file=polar.file, database="world")$coords
lines(world.bds)

## Subset to a smaller geographic area in southwestern U.S.
subset.elev <- var.subset(elev, llx=-2100, urx=0, lly=-6500, ury=-4000)
## Make a plot of this subset.
image(subset.elev$x.cell.ctr, subset.elev$y.cell.ctr,
      subset.elev$data[,,1], xlab="Projection x-coord (km)",
      ylab="Projection y-coord (km)", zlim=range(subset.elev$data[,,1]),
      col=topo.colors(20))
## Find state boundaries on this projection, superimpose them on the plot.
state.bds <- get.map.lines.M3.proj(file=polar.file)$coords
lines(state.bds)



## Find the path to second demo file (with Lambert conic
## conformal projection).
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")

## Read in the ozone for July 4 for eastern U.S.
oz <- get.M3.var(file=lcc.file, var="O3", lcol=80, urow=95,
                      ldatetime=as.Date("2001-07-04"),
                      udatetime=as.Date("2001-07-04"))
## Make a plot.
image(oz$x.cell.ctr, oz$y.cell.ctr, oz$data[,,1,1],
      xlab="Projection x-coord (km)", ylab="Projection y-coord (km)",
      zlim=range(oz$data), col=heat.colors(15))

## Find map lines on this projection, superimpose them on the plot.
state.bds <- get.map.lines.M3.proj(file=lcc.file)$coords
lines(state.bds)



