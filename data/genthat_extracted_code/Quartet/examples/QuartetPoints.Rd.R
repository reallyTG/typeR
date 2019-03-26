library(Quartet)


### Name: QuartetPoints
### Title: Plot tree differences on ternary plots
### Aliases: QuartetPoints SplitPoints BipartitionPoints

### ** Examples

{
  library('Ternary')
  data('sq_trees')
  
  TernaryPlot(alab='Unresolved', blab='Contradicted', clab='Consistent', point='right')
  TernaryLines(list(c(0, 2/3, 1/3), c(1, 0, 0)), col='red', lty='dotted')
  TernaryText(QuartetPoints(sq_trees, cf=sq_trees$collapse_one), 1:15, 
    col=Ternary::cbPalette8[2], cex=0.8)
  TernaryText(SplitPoints(sq_trees, cf=sq_trees$collapse_one), 1:15, 
    col=Ternary::cbPalette8[3], cex=0.8)
  legend('bottomright', c("Quartets", "Bipartitions"), bty='n', pch=1, cex=0.8,
    col=Ternary::cbPalette8[2:3])
  
}




