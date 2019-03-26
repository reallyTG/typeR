library(vcdExtra)


### Name: logseries
### Title: The Logarithmic Series Distribution
### Aliases: Logseries dlogseries plogseries qlogseries rlogseries
### Keywords: distribution

### ** Examples

XL <-expand.grid(x=1:5, p=c(0.33, 0.66, 0.99))
lgs.df <- data.frame(XL, prob=dlogseries(XL[,"x"], XL[,"p"]))
lgs.df$p = factor(lgs.df$p)
str(lgs.df)

require(lattice)
mycol <- palette()[2:4]
xyplot( prob ~ x, data=lgs.df, groups=p,
	xlab=list('Number of events (k)', cex=1.25),
	ylab=list('Probability',  cex=1.25),
	type='b', pch=15:17, lwd=2, cex=1.25, col=mycol,
	key = list(
					title = 'p',
					points = list(pch=15:17, col=mycol, cex=1.25),
					lines = list(lwd=2, col=mycol),
					text = list(levels(lgs.df$p)),
					x=0.9, y=0.98, corner=c(x=1, y=1)
					)
	)


# random numbers
hist(rlogseries(200, prob=.4), xlab='x')
hist(rlogseries(200, prob=.8), xlab='x')




