library(ggtern)


### Name: data_WhiteCells
### Title: Aichisons White Cells
### Aliases: data_WhiteCells WhiteCells

### ** Examples

data(WhiteCells)
   ggtern(WhiteCells,aes(G,L,M)) + 
   geom_density_tern(aes(color=Experiment)) +
   geom_point(aes(shape=Experiment)) +
   facet_wrap(~Experiment,nrow=2)



