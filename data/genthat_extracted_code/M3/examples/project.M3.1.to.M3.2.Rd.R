library(M3)


### Name: project.M3.1.to.M3.2
### Title: Project coordinates based on projection in the first file to the
###   projection given in the second
### Aliases: project.M3.1.to.M3.2

### ** Examples

## Find the path to a demo file with lambert conic conformal projection.
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")

## Read in the ozone for July 4 for eastern U.S.
lcc.oz <- get.M3.var(file=lcc.file, var="O3",
                      lcol=90, ucol=130, lrow=30, urow=80,
                      ldatetime=as.Date("2001-07-04"),
                      udatetime=as.Date("2001-07-04"))

## Get the cell centers for this subset.
east.ctrs <- expand.grid(lcc.oz$x.cell.ctr, lcc.oz$y.cell.ctr)
plot(east.ctrs, cex=0.3, xlab="x", ylab="y")

## Find map lines on this projection, superplot.
lcc.state.bds <- get.map.lines.M3.proj(file=lcc.file)$coords
lines(lcc.state.bds, col="darkblue")


## Find the path to a demo file with polar stereographic projection.
polar.file <- system.file("extdata/surfinfo_polar.ncf", package="M3")

## Put the cell centers from the subsetted ozone data on this polar
## stereographic projection.
polar.oz <- project.M3.1.to.M3.2(east.ctrs[,1], east.ctrs[,2],
                                 from.file=lcc.file,
                                 to.file=polar.file,
                                 units=lcc.oz$hz.units)

## Plot the cells centers and boundary lines on the polar
## stereographic projection.
dev.new()
plot(polar.oz$coords)
polar.state.bds <- get.map.lines.M3.proj(file=polar.file)$coords
lines(polar.state.bds, col="darkblue")



