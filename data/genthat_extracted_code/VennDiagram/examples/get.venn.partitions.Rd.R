library(VennDiagram)


### Name: get.venn.partitions
### Title: Get the size of individual partitions in a Venn diagram
### Aliases: get.venn.partitions

### ** Examples

# Compare force.unique options
x <- list(a = c(1, 1, 1, 2, 2, 3), b = c(2, 2, 2, 3, 4, 4))
get.venn.partitions(x)
get.venn.partitions(x, force.unique = FALSE)

# Figure 1D from ?venn.diagram
xFig1d = list(
  I = c(1:60, 61:105, 106:140, 141:160, 166:175, 176:180, 181:205,
       206:220),
  IV = c(531:605, 476:530, 336:375, 376:405, 181:205, 206:220, 166:175,
        176:180),
  II = c(61:105, 106:140, 181:205, 206:220, 221:285, 286:335, 336:375,
          376:405),
  III = c(406:475, 286:335, 106:140, 141:160, 166:175, 181:205, 336:375,
           476:530)
 )
get.venn.partitions(xFig1d)
grid.draw(VennDiagram::venn.diagram(x, NULL))



