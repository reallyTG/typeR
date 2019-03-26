library(vcd)


### Name: Ord_plot
### Title: Ord Plots
### Aliases: Ord_plot Ord_estimate
### Keywords: category

### ** Examples

## Simulated data examples:
dummy <- rnbinom(1000, size = 1.5, prob = 0.8)
Ord_plot(dummy)

## Real data examples:
data("HorseKicks")
data("Federalist")
data("Butterfly")
data("WomenQueue")

## Not run: 
##D grid.newpage()
##D pushViewport(viewport(layout = grid.layout(2, 2)))
##D 
##D pushViewport(viewport(layout.pos.col=1, layout.pos.row=1))
##D Ord_plot(HorseKicks, main = "Death by horse kicks", newpage = FALSE)
##D popViewport()
##D 
##D pushViewport(viewport(layout.pos.col=1, layout.pos.row=2))
##D Ord_plot(Federalist, main = "Instances of 'may' in Federalist papers", newpage = FALSE)
##D popViewport()
##D 
##D pushViewport(viewport(layout.pos.col=2, layout.pos.row=1))
##D Ord_plot(Butterfly, main = "Butterfly species collected in Malaya", newpage = FALSE)
##D popViewport()
##D 
##D pushViewport(viewport(layout.pos.col=2, layout.pos.row=2))
##D Ord_plot(WomenQueue, main = "Women in queues of length 10", newpage = FALSE)
##D popViewport(2)
## End(Not run)

## same
mplot(
  Ord_plot(HorseKicks, return_grob = TRUE, main = "Death by horse kicks"),
  Ord_plot(Federalist, return_grob = TRUE, main = "Instances of 'may' in Federalist papers"),
  Ord_plot(Butterfly, return_grob = TRUE, main = "Butterfly species collected in Malaya"),
  Ord_plot(WomenQueue, return_grob = TRUE, main = "Women in queues of length 10")
)



