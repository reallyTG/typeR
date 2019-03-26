library(RSDA)


### Name: mcfa.scatterplot
### Title: Plot Interval Scatterplot
### Aliases: mcfa.scatterplot

### ** Examples

data("ex_mcfa1")
sym.table <- classic.to.sym(ex_mcfa1, concept = "suspect",
                   variables.types = c(hair = type.set(),
                                       eyes = type.set(),
                                       region = type.set()))

res <- sym.mcfa(sym.table, c(1,2))
mcfa.scatterplot(res[,1], res[,2], sym.data = sym.table, pos.var = c(1,2))



