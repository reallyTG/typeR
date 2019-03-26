library(caRpools)


### Name: carpools.read.depth
### Title: QC: Plot Sequencing Read Depth
### Aliases: carpools.read.depth
### Keywords: ~readdepth ~qc

### ** Examples

data(caRpools)

carpools.read.depth(datasets = list(CONTROL1), namecolumn=1 ,fullmatchcolumn=2,
  dataset.names=list(d.CONTROL1), extractpattern=expression("^(.+?)_.+"),
  xlab="Genes", ylab="Read Count per sgRNA",statistics=TRUE, labelgenes = NULL,
  controls.target = "CASP8", controls.nontarget="random", waterfall=FALSE)




