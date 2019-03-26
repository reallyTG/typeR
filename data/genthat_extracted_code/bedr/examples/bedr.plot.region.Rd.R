library(bedr)


### Name: bedr.plot.region
### Title: Visualize regions or intervals
### Aliases: bedr.plot.region
### Keywords: plot venn

### ** Examples

if (check.binary("bedtools")) {
	# example data
	a <- get.random.regions(n = 1000, chr = "chr22", size.mean = 10)
	b <- get.random.regions(n = 1000, chr = "chr22", size.mean = 10)
	d <- get.random.regions(n = 1000, chr = "chr22", size.mean = 10)
	e <- get.random.regions(n = 1000, chr = "chr22", size.mean = 10)
	f <- get.random.regions(n = 1000, chr = "chr22", size.mean = 10)

	pdf("bedr.plot.region.ex.pdf")

	# basic venn diagrams
	bedr.plot.region(input = list(a=a,b=b))
	bedr.plot.region(input = list(a=a,b=b,d=d))
	#bedr.plot.region(input = list(a=a,b=b,d=d,e=e))
	#bedr.plot.region(input = list(a=a,b=b,d=d,e=e,f=f))

	### change venn parameters
	bedr.plot.region(
		input = list(a=a,b=b,d=d),
		params = list(lty = 2, label.col = "black", main = "Region Overlap")
		)

	### try with different 
	#bedr.plot.region(input = list(a=a,b=b), feature = "gene")
	#bedr.plot.region(input = list(a=a,b=b), feature = "reference")
	#bedr.plot.region(input = list(a=a,b=b), feature = "interval")
	#bedr.plot.region(input = list(a=a,b=b), feature = "cluster")
	#bedr.plot.region(input = list(a=a,b=b), feature = "bp")

	dev.off()
	}



