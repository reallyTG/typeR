library(genoPlotR)


### Name: trim
### Title: Trimming data frames or more complex objects with >= 2 numeric
###   columns
### Aliases: trim trim.default trim.dna_seg trim.comparison trim.annotation
###   trim.seg_plot
### Keywords: data

### ** Examples

## Load
data(barto)
xlim_ref <- c(10000, 45000)
## Seg 2 (ref)
barto$dna_segs[[2]] <- trim(barto$dna_segs[[2]], xlim=xlim_ref)
## Seg 1
barto$comparisons[[1]] <- trim(barto$comparisons[[1]], xlim2=xlim_ref)
xlim1 <- range(barto$comparisons[[1]], overall=FALSE)$xlim1
barto$dna_segs[[1]] <- trim(barto$dna_segs[[1]], xlim=xlim1)
## Seg 3
barto$comparisons[[2]] <- trim(barto$comparisons[[2]], xlim1=xlim_ref)
xlim3 <- range(barto$comparisons[[2]], overall=FALSE)$xlim2
barto$dna_segs[[3]] <- trim(barto$dna_segs[[3]], xlim=xlim3)
## Seg 4
barto$comparisons[[3]] <- trim(barto$comparisons[[3]], xlim1=xlim3)
xlim4 <- range(barto$comparisons[[3]], overall=FALSE)$xlim2
barto$dna_segs[[4]] <- trim(barto$dna_segs[[4]], xlim=xlim4)
## Plot
plot_gene_map(barto$dna_segs, barto$comparisons)

## With seg_plot
x <- 1:20
y <- rnorm(20)
sp <- seg_plot(func=pointsGrob, args=list(x=x, y=y,
                                  gp=gpar(col=1:20, cex=1:3)))
## Trim 
sp_trim <- trim(sp, c(3, 10))
str(sp_trim)
range(sp_trim$arg$x)



