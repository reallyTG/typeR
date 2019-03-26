library(cglasso)


### Name: MKMEP
### Title: Megakaryocyte-Erythroid Progenitors
### Aliases: MKMEP
### Keywords: datasets

### ** Examples

data("MKMEP")
out_cglasso <- cglasso(MKMEP, pendiag = TRUE, nrho = 200L, rho.min.ratio = 0.35)
out_ebic <- ebic(out_cglasso)
plot(out_ebic, type = "l")

out_graph <- to_graph(out_cglasso, nrho = which.min(out_ebic$value_gof))
V(out_graph)$color <- "white"
V(out_graph)$frame.color <- NA
V(out_graph)$label.color <- "black"
E(out_graph)$color <- "gray75"

plot(out_graph, layout = layout_with_lgl(out_graph))
mtext(text = "Megakaryocytic MEP population", cex = 1.5, line = 1)



