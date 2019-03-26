library(maptools)


### Name: Rgshhs
### Title: Read GSHHS data into sp object
### Aliases: Rgshhs getRgshhsMap
### Keywords: spatial

### ** Examples

if (rgeosStatus()) {
gshhs.c.b <- system.file("share/gshhs_c.b", package="maptools")
WEx <- c(-12, 3)
WEy <- c(48, 59)
WE <- getRgshhsMap(gshhs.c.b, xlim=WEx, ylim=WEy)
plot(WE, col="khaki", xlim=WEx, ylim=WEy, xaxs="i", yaxs="i", axes=TRUE)
NZx <- c(160,180)
NZy <- c(-50,-30)
NZ <- Rgshhs(gshhs.c.b, xlim=NZx, ylim=NZy)
plot(NZ$SP, col="khaki", pbg="azure2", xlim=NZx, ylim=NZy, xaxs="i", yaxs="i", axes=TRUE)
GLx <- c(265,285)
GLy <- c(40,50)
GL <- Rgshhs(gshhs.c.b, xlim=GLx, ylim=GLy)
plot(GL$SP, col="khaki", pbg="azure2", xlim=GLx, ylim=GLy, xaxs="i", yaxs="i", axes=TRUE)
BNLx <- c(2,8)
BNLy <- c(49,54)
wdb_lines <- system.file("share/wdb_borders_c.b", package="maptools")
BNLp <- Rgshhs(gshhs.c.b, xlim=BNLx, ylim=BNLy)
BNLl <- Rgshhs(wdb_lines, xlim=BNLx, ylim=BNLy)
plot(BNLp$SP, col="khaki", pbg="azure2", xlim=BNLx, ylim=BNLy, xaxs="i", yaxs="i", axes=TRUE)
lines(BNLl$SP)
xlims <- c(0,360)
ylims <- c(-90,90)
world <- Rgshhs(gshhs.c.b, xlim=xlims, ylim=ylims, level=1, checkPolygons=TRUE)
}



