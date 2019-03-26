library(QTL.gCIMapping)


### Name: QTL.gCIMapping
### Title: QTL Genome-Wide Composite Interval Mapping
### Aliases: QTL.gCIMapping QTL.gCIMapping
### Keywords: R QTL.gCIMapping package

### ** Examples

G=data(f2data)
QTL.gCIMapping(file=f2data,fileFormat="GCIM",fileICIMcov=NULL,Population="F2",
Model="Random",WalkSpeed=1,CriLOD=2.5,Likelihood="REML",flagrqtl="FALSE",
DrawPlot="FALSE",PlotFormat="png",Resolution="Low",Trait=1,dir=tempdir()) 



