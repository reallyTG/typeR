library(genoPlotR)


### Name: seg_plot
### Title: seg_plot class and class functions
### Aliases: seg_plot as.seg_plot is.seg_plot
### Keywords: data

### ** Examples

## Using the existing pointsGrob
x <- 1:20
y <- rnorm(20)
sp <- seg_plot(func=pointsGrob, args=list(x=x, y=y,
                                  gp=gpar(col=1:20, cex=1:3)))
is.seg_plot(sp)
## Function seg_plot(...) is identical to as.seg_plot(list(...))
sp2 <- as.seg_plot(list(func=pointsGrob, args=list(x=x, y=y,
                                           gp=gpar(col=1:20, cex=1:3))))
identical(sp, sp2)
## For the show, plot the obtained result
grb <- do.call(sp$func, sp$args)
## Trim the seg_plot
sp_trim <- trim(sp, c(3, 10))
## Changing color and function "on the fly"
sp_trim$args$gp$col <- "blue"
sp_trim$func <- linesGrob
grb_trim <- do.call(sp_trim$func, sp_trim$args)
## Now plot
plot.new()
pushViewport(viewport(xscale=c(0,21), yscale=c(-4,4)))
grid.draw(grb)
grid.draw(grb_trim)

## Using home-made function
triangleGrob <- function(start, end, strand, col, ...) {
  x <- c(start, (start+end)/2, end)
  y1 <- 0.5 + 0.4*strand
  y <- c(y1, rep(0.5, length(y1)), y1)
  polygonGrob(x, y, gp=gpar(col=col), default.units="native",
              id=rep(1:7, 3))
}
start <- seq(1, 19, by=3)+rnorm(7)/3
end <- start + 1 + rnorm(7)
strand <- sign(rnorm(7))
sp_tr <- seg_plot(func=triangleGrob,
                  args=list(start=start, end=end, strand=strand,
                    col=1:length(start)), xargs=c("start", "end"))
grb_tr <- do.call(sp_tr$func, sp_tr$args)
plot.new()
pushViewport(viewport(xscale=c(1,22), yscale=c(-2,2)))
grid.draw(grb_tr)
## Trim
sp_tr_trim <- trim(sp_tr, xlim=c(5, 15))
str(sp_tr_trim)
## If the correct xargs are not indicated, trimming won't work
sp_tr$xargs <- c("x")
sp_tr_trim2 <- trim(sp_tr, xlim=c(5, 15))
identical(sp_tr_trim, sp_tr_trim2)

y1 <- convertY(grobY(grb_tr, "south"), "native")
y2 <- convertY(grobY(grb_tr, "north"), "native")
heightDetails(grb)
grb

## Applying it to plot_gene_maps
data(three_genes)

## Build data to plot
xs <- lapply(dna_segs, range)
colors <- c("red", "blue", "green")

seg_plots <- list()
for (i in 1:length(xs)){
  x <- seq(xs[[i]][1], xs[[i]][2], length=20)
  seg_plots[[i]] <- seg_plot(func=pointsGrob,
                             args=list(x=x, y=rnorm(20)+2*i,
                               default.units="native", pch=3,
                               gp=gpar(col=colors[i], cex=0.5)))
}
plot_gene_map(dna_segs, comparisons,
              seg_plots=seg_plots,
              seg_plot_height=0.5,
              seg_plot_height_unit="inches",
              dna_seg_scale=TRUE)

## A more complicated example
data(barto)
tree <- newick2phylog("(BB:2.5,(BG:1.8,(BH:1,BQ:0.8):1.9):3);")
## Showing several subsegments per genome
xlims2 <- list(c(1445000, 1415000, 1380000, 1412000),
               c(  10000,   45000,   50000,   83000, 90000, 120000),
               c(  15000,   36000,   90000,  120000, 74000,  98000),
               c(   5000,    82000))

## Adding fake data in 1kb windows
seg_plots <- lapply(barto$dna_segs, function(ds){
  x <- seq(1, range(ds)[2], by=1000)
  y <- jitter(seq(100, 300, length=length(x)), amount=50)
  seg_plot(func=linesGrob, args=list(x=x, y=y, gp=gpar(col=grey(0.3), lty=2)))
})
plot_gene_map(barto$dna_segs, barto$comparisons, tree=tree,
              seg_plots=seg_plots,
              seg_plot_height=0.5,
              seg_plot_height_unit="inches",
              xlims=xlims2,
              limit_to_longest_dna_seg=FALSE,
              dna_seg_scale=TRUE,
              main="Random plots for the same segment in 4 Bartonella genomes")




