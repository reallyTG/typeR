library(DescTools)


### Name: PlotDot
### Title: Cleveland's Dot Plots
### Aliases: PlotDot
### Keywords: hplot

### ** Examples

PlotDot(VADeaths, main = "Death Rates in Virginia - 1940")
op <- par(xaxs = "i")  # 0 -- 100%
PlotDot(t(VADeaths), xlim = c(0,100),
        main = "Death Rates in Virginia - 1940")
par(op)

# add some error bars
PlotDot(VADeaths, main="Death Rates in Virginia - 1940", col="red", pch=21,
        args.errbars = list(from=VADeaths-2, to=VADeaths+2, mid=VADeaths,
                            cex=1.4))

# add some other values
PlotDot(VADeaths+3, pch=15, col="blue", add=TRUE, labels=NA)

# same as PlotDotCI
xci <- do.call(rbind, tapply( d.pizza$delivery_min, d.pizza$driver,
                              MeanCI, conf.level=0.99, na.rm=TRUE))

PlotDot(xci[,1], main="delivery_min ~ driver", pch=21, bg="grey80", col="black",
        args.errbars = list(from=xci[,2], to=xci[,3], mid=xci[,1], lwd=2, col="grey40", cex=1.5),
        xlim=c(15,35), panel.before=grid())

# with group data
x <- with(d.pizza, tapply(temperature, list(area, driver), mean, na.rm=TRUE))

PlotDot(x, gdata = tapply(d.pizza$temperature, d.pizza$driver, mean, na.rm=TRUE),
        gpch = 15)

# special format
par(lend=1)

PlotDot(VADeaths, main="Death Rates in Virginia - 1940", pch="|", lcolor = hecru, col=hred,
        args.errbars = list(from=VADeaths-2, to=VADeaths+2, mid=VADeaths,
                            cex=1.3, lwd=8, code=0, col=hgreen))

# Error bars for binomial confidence intervals
tab <- table(d.pizza$driver, d.pizza$wine_delivered)
xci <- SetNames(BinomCI(tab[,1], rowSums(tab)), rownames=rownames(tab))
PlotDot(xci[,1], main="wine delivered ~ driver ", xlim=c(0,1),
        args.errbars=list(from=xci[,-1], mid=xci[,1], pch=21))


# Error bars for confidence intervals for means
xci <- do.call(rbind, tapply(d.pizza$delivery_min, d.pizza$driver,
                             MeanCI, conf.level=0.99, na.rm=TRUE))

PlotDot(xci[, 1], main="delivery_min ~ driver", args.errbars=list(from=xci))


# Setting the colours
# define some error bars first
lci <- sweep(x = VADeaths, MARGIN = 2, FUN = "-", 1:4)
uci <- sweep(x = VADeaths, MARGIN = 1, FUN = "+", 1:5)

PlotDot(VADeaths, main="This should only show how to set the colours, not be pretty",
        pch=21, col=c("blue","grey"), bg=c("red", "yellow"),
        gcolor = c("green", "blue", "orange", "magenta"), gdata=c(10,20,30,40),
        gpch = c(15:18), lcolor = "orange",
        args.errbars = list(from=lci, to=uci, mid=VADeaths, cex=1.4))




