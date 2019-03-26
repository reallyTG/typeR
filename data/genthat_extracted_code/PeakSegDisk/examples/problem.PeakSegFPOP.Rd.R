library(PeakSegDisk)


### Name: problem.PeakSegFPOP
### Title: problem PeakSegFPOP
### Aliases: problem.PeakSegFPOP

### ** Examples






library(PeakSegDisk)


data(Mono27ac, envir=environment())


data.dir <- file.path(


  tempfile(),


  "H3K27ac-H3K4me3_TDHAM_BP",


  "samples",


  "Mono1_H3K27ac",


  "S001YW_NCMLS",


  "problems",


  "chr11-60000-580000")


dir.create(data.dir, recursive=TRUE, showWarnings=FALSE)


write.table(


  Mono27ac$coverage, file.path(data.dir, "coverage.bedGraph"),


  col.names=FALSE, row.names=FALSE, quote=FALSE, sep="\t")





## Compute one model with penalty=1952.6


fit <- problem.PeakSegFPOP(data.dir, "1952.6")





## Visualize that model.


ann.colors <- c(


  noPeaks="#f6f4bf",


  peakStart="#ffafaf",


  peakEnd="#ff4c4c",


  peaks="#a445ee")


library(ggplot2)


lab.min <- Mono27ac$labels[1, chromStart]


lab.max <- Mono27ac$labels[.N, chromEnd]


changes <- fit$segments[, list(


  constraint=ifelse(diff(mean)==0, "equality", "inequality"),


  chromStart=chromEnd[-1],


  chromEnd=chromEnd[-1])]


gg <- ggplot()+theme_bw()


if(require(penaltyLearning)){


  gg <- gg+


    penaltyLearning::geom_tallrect(aes(


      xmin=chromStart, xmax=chromEnd,


      fill=annotation),


      color="grey",


      data=Mono27ac$labels)+


    scale_fill_manual("label", values=ann.colors)


}


gg <- gg+


  geom_step(aes(


    chromStart, count),


    color="grey50",


    data=Mono27ac$coverage)+


  geom_segment(aes(


    chromStart, mean,


    xend=chromEnd, yend=mean),


    color="green",


    size=1,


    data=fit$segments)+


  geom_segment(aes(


    chromStart, mean,


    xend=chromEnd, yend=mean),


    color="green",


    size=1,


    data=fit$segments)+


  geom_vline(aes(


    xintercept=chromEnd, linetype=constraint),


    color="green",


    data=changes)+


  scale_linetype_manual(values=c(inequality="dotted", equality="solid"))


gg





gg+


  coord_cartesian(xlim=c(lab.min, lab.max))








