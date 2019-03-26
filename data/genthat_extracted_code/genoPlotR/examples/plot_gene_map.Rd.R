library(genoPlotR)


### Name: plot_gene_map
### Title: Plot gene and genome maps
### Aliases: plot_gene_map
### Keywords: hplot

### ** Examples

old.par <- par(no.readonly=TRUE)
data("three_genes")

## Segments only
plot_gene_map(dna_segs=dna_segs) 

## With comparisons
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons) 

## Tree
names <- c("A_aaa", "B_bbb", "C_ccc")
names(dna_segs) <- names
tree <- newick2phylog("(((A_aaa:4.2,B_bbb:3.9):3.1,C_ccc:7.3):1);")
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              tree=tree)
## Increasing tree width
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              tree=tree, tree_width=3)
## Annotations on the tree
tree2 <- newick2phylog("(((A_aaa:4.2,B_bbb:3.9)97:3.1,C_ccc:7.3)78:1);")
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              tree=tree2, tree_width=3)
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              tree=tree2, tree_width=3, tree_branch_labels_cex=0.5)
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              tree=tree2, tree_width=3, tree_branch_labels_cex=0)

## Annotation
## Calculating middle positions
mid_pos <- middle(dna_segs[[1]])

# Create first annotation
annot1 <- annotation(x1=mid_pos, text=dna_segs[[1]]$name)
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons, annotations=annot1)

## Exploring options
annot2 <- annotation(x1=c(mid_pos[1], dna_segs[[1]]$end[2]),
                     x2=c(NA, dna_segs[[1]]$end[3]),
                     text=c(dna_segs[[1]]$name[1], "region1"),
                     rot=c(30, 0), col=c("grey", "black"))
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              annotations=annot2, annotation_height=1.3)

## xlims
## Just returning a segment
plot_gene_map(dna_segs, comparisons,
              xlims=list(NULL, NULL, c(Inf,-Inf)),
              dna_seg_scale=TRUE)
## Removing one gene
plot_gene_map(dna_segs, comparisons,
              xlims=list(NULL, NULL, c(-Inf,2800)),
              dna_seg_scale=TRUE)

## offsets
offsets <- c(0, 0, 0)  
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons, offsets=offsets)
offsets <- c(200, 400, 0)  
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons, offsets=offsets)

## main
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              main="Comparison of A, B and C")
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              main="Comparison of A, B and C", main_pos="left")

## dna_seg_labels
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              dna_seg_labels=c("Huey", "Dewey", "Louie"))

## dna_seg_labels size
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              dna_seg_labels=c("Huey", "Dewey", "Louie"),
              dna_seg_label_cex=2)

## dna_seg_line
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              dna_seg_line=c("FALSE", "red", grey(0.6)))

## gene_type
plot_gene_map(dna_segs=dna_segs, comparisons=comparisons,
              gene_type="side_blocks")

##
## From here on, using a bigger dataset from a 4-genome comparison
##
data("barto")
## Adding a tree
tree <- newick2phylog("(BB:2.5,(BG:1.8,(BH:1,BQ:0.8):1.9):3);")
## Showing only subsegments
xlims1 <- list(c(1380000, 1445000),
               c(10000, 83000),
               c(15000, 98000),
               c(5000, 82000))
## Reducing dataset size for speed purpose
for (i in 1:length(barto$dna_segs)){
    barto$dna_segs[[i]] <- trim(barto$dna_segs[[i]], xlim=xlims1[[i]])
    if (i < length(barto$dna_segs))
        barto$comparisons[[i]] <- trim(barto$comparisons[[i]],
                                      xlim1=xlims1[[i]], xlims1[[i+1]])   
}
plot_gene_map(barto$dna_segs, barto$comparisons, tree=tree,
              xlims=xlims1,
              dna_seg_scale=TRUE)
## Showing several subsegments per genome
xlims2 <- list(c(1445000, 1415000, 1380000, 1412000),
               c(  10000,   45000,   50000,   83000, 90000, 120000),
               c(  15000,   36000,   90000,  120000, 74000,  98000),
               c(   5000,    82000))

## dna_seg_scale, global_color_scheme, size, number, color of dna_seg_scale,
## size of dna_seg_scale labels
plot_gene_map(barto$dna_segs, barto$comparisons, tree=tree, xlims=xlims2,
              dna_seg_scale=c(TRUE, FALSE, FALSE, TRUE), scale=FALSE,
              dna_seg_label_cex=1.7,
              dna_seg_label_col=c("black", "grey", "blue", "red"),
              global_color_scheme=c("e_value", "auto", "grey", "0.7"),
              n_scale_ticks=3, scale_cex=1)

## Hand-made offsets: size of all gaps
offsets2 <- list(c(10000, 10000),
                 c(2000, 2000, 2000),
                 c(10000, 5000, 2000),
                 c(10000))
plot_gene_map(barto$dna_segs, barto$comparisons, tree=tree,
              #annotations=annots,
              xlims=xlims2,
              offsets=offsets2,
              dna_seg_scale=TRUE)
##
## Exploring and modifying a previously plotted gene map plot
##
## View viewports
current.vpTree()
## Go down to one of the viewports, add an xaxis, go back up to root viewport
downViewport("dna_seg_scale.3.2")
grid.rect()
upViewport(0)
## Get all the names of the objects
grobNames <- getNames()
grobNames
## Change the color ot the scale line
grid.edit("scale.lines", gp=gpar(col="grey"))
## Remove first dna_seg_lines
grid.remove("dna_seg_line.1.1")

##
## Plot genoPlotR logo
##
col <- c("#B2182B", "#D6604D", "#F4A582", "#FDDBC7",
         "#D1E5F0", "#92C5DE", "#4393C3", "#2166AC")
cex <- 2.3
## First segment 
start1 <- c(150, 390, 570)
end1   <- c(  1, 490, 690)
genoR <- c(270, 530)
## Second segment
start2 <- c(100, 520, 550)
end2   <- c(240, 420, 650)
Plot <- c(330)
## dna_segs
ds1 <- as.dna_seg(data.frame(name=c("", "", ""),
                             start=start1, end=end1, strand=rep(1, 3),
                             col=col[c(2, 6, 1)], stringsAsFactor=FALSE))
ds_genoR <- as.dna_seg(data.frame(name=c("geno", "R"),
                             start=genoR, end=genoR, strand=rep(1, 2),
                             col=c(col[8], "black"),
                             stringsAsFactor=FALSE), cex=cex, gene_type="text")
ds2 <- as.dna_seg(data.frame(name=c("", "", ""),
                             start=start2, end=end2, strand=rep(1, 3),
                             col=col[c(5, 3, 7)],
                             stringsAsFactor=FALSE))
ds_Plot <- as.dna_seg(data.frame(name="Plot",
                             start=Plot, end=Plot, strand=1,
                             col=col[c(1)],
                             stringsAsFactor=FALSE), cex=cex, gene_type="text")
## comparison
c1 <- as.comparison(data.frame(start1=start1, end1=end1,
                               start2=start2, end2=end2,
                               col=grey(c(0.6, 0.8, 0.5))))
## Generate genoPlotR logo
## Not run: 
##D cairo_pdf("logo.pdf", h=0.7, w=3)
## End(Not run)
par(fin=c(0.7, 3))
plot_gene_map(dna_segs=list(c(ds1, ds_genoR), c(ds2, ds_Plot)),
              comparisons=list(c1), scale=FALSE, dna_seg_scale=FALSE,
              dna_seg_line=grey(0.7), offsets=c(-20,160))
## Not run: 
##D dev.off()
## End(Not run)
par(old.par)



