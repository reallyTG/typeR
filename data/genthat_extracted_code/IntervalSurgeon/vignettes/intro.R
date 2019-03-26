## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height=5, dev="svg", fig.align="center")

## ------------------------------------------------------------------------
library(IntervalSurgeon)

starts <- 3*1:10
ends <- 5*1:10

intervals <- cbind(starts, ends)

## ------------------------------------------------------------------------
sectioned <- sections(breaks(intervals))
flattened <- flatten(intervals)
depths <- depth(intervals)
piles <- pile(intervals)

## ----fig.width=7, fig.height=3, echo=FALSE-------------------------------
plot_intervals <- function(ints, y, whisker_size=0.1, ...) {
	segments(x0=ints[,1], x1=ints[,2], y0=y, y1=y, ...)
	for (i in 1:2)
		segments(y0=y-whisker_size/2, y1=y+whisker_size/2, x0=ints[,i], x1=ints[,i], ...)
}
par(mar=rep(0, 4))
plot(x=NULL, xlab="", ylab="", axes=FALSE, xlim=range(intervals), ylim=c(0, 6))
cent <- mean(range(intervals))
text(x=cent, pos=3, offset=1, labels="intervals", y=5)
with(list(y=4.75+0.5*seq(from=1, to=-1, length.out=nrow(intervals))), plot_intervals(whisker_size=0, lwd=2, col="black", ints=intervals, y=y))
text(x=cent, pos=3, offset=1, labels="sectioned", y=3.25)
text(x=cent, pos=3, offset=1, labels="flattened", y=2)
text(x=cent, pos=3, offset=1, labels="depths", y=1)
rect(xleft=sectioned[,1], xright=sectioned[,2], ytop=depths/max(depths), ybottom=0, col="light grey")
plot_intervals(lwd=2, col="blue", ints=sectioned, y=3.25)
plot_intervals(lwd=2, col="red", ints=flattened, y=2)
#axis(side=1)

## ------------------------------------------------------------------------
x_starts <- 10*1:10
x <- cbind(x_starts, x_starts + 5)

y_starts <- 20*1:5 + 1
y <- cbind(y_starts, y_starts + 7)

## ------------------------------------------------------------------------
detached_sorted_nonempty(x)

## ----fig.width=7, fig.height=4, echo=FALSE-------------------------------
all_ints <- c(
	list(x=x, y=y),
	lapply(
		lapply(FUN=match.fun, X=setNames(nm=c("intersects", "unions", "setdiffs"))),
		function(f) f(x,y,check=TRUE)
	)
)
pts <- breaks(c(x, y))
par(mar=rep(0, 4))
plot(axes=FALSE, x=NULL, xlab="", ylab="", xlim=range(c(x, y)), ylim=c(0.5, length(all_ints)+0.5))
#axis(side=1)
abline(v=pts, col="grey")
for (i in seq_along(all_ints)) {
	ypos <- length(all_ints) - i + 1
	plot_intervals(ints=all_ints[[i]], y=ypos, lwd=2, col=rainbow(length(all_ints))[i])
	text(x=mean(range(c(x, y))), pos=3, offset=1, labels=names(all_ints)[i], y=ypos)
}

## ------------------------------------------------------------------------
x <- cbind(3*1:8, 5*1:8)
y <- cbind(4*1:4, 7*1:4)
join_xy <- join(x, y)

head(join_xy)

## ------------------------------------------------------------------------
x <- cbind(0, c(a=10, b=20, c=30))
y <- cbind(c(A=0, B=10, C=20), c(5, 15, 25))

## ----fig.width=7, fig.height=3.5, echo=FALSE-----------------------------
brks <- breaks(rbind(x, y))
lx <- nrow(x); ly <- nrow(y)
par(mar=rep(0, 4))
plot(x=NULL, xlab="", ylab="", axes=FALSE, xlim=range(c(x, y)), ylim=c(0, lx+ly))
abline(v=brks, col="grey")
ys <- lx+ly-seq(from=0.5, length.out=lx+ly)
plot_intervals(lwd=2, col=rep(rainbow(2), times=c(lx, ly)), y=ys, ints=rbind(x, y))
text(labels=c(rownames(x), rownames(y)), x=(c(x[,1], y[,1])+c(x[,2], y[,2]))/2, y=ys, pos=3)

## ------------------------------------------------------------------------
annotate(x, y)

## ----echo=FALSE----------------------------------------------------------
	regions <- data.frame(chr=c("X", 2), start=1:2, end=100:101)
	genes <- data.frame(chr=c(1, "X", 2, 2), start=1:4, end=2:5)

## ------------------------------------------------------------------------
regions_annotated_with_genes <- lapply(
	c(1:22, "X", "Y"),
	function(chromosome) {
		regions_on_chr <- as.matrix(regions[regions$chr == chromosome,c("start", "end")])
		genes_on_chr <- as.matrix(genes[genes$chr == chromosome,c("start","end")])
		annotate(regions_on_chr, genes_on_chr)
	}
)

