library(DescTools)


### Name: PlotLinesA
### Title: Plot Lines
### Aliases: PlotLinesA
### Keywords: hplot

### ** Examples

m <- matrix(c(3,4,5,1,5,4,2,6,2), nrow = 3,
            dimnames = list(dose = c("A","B","C"),
                            age  = c("2010","2011","2012")))

PlotLinesA(m, col=c(Pal("Helsana")), main="Dose ~ age_grp", lwd=3, ylim=c(1, 10))


# example from MASS
shoes <- list(
  A = c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3),
  B = c(14, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6))

PlotLinesA(do.call(rbind, shoes), xlim=c(0.75,2.25), col=1, main="shoes",
           pch=21, pch.bg="white", pch.col=1, pch.cex=1.5)

# let's define some arbitrary x-coordinates
PlotLinesA(x=c(1,2,6,8,15), y=VADeaths)



