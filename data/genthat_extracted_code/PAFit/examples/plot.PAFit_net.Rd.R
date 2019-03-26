library(PAFit)


### Name: plot.PAFit_net
### Title: Plot a 'PAFit_net' object
### Aliases: plot.PAFit_net

### ** Examples

    library("PAFit")
    # a network from Bianconi-Barabasi model
    net        <- generate_BB(N = 50 , m = 10 , s = 10)
    plot(net, plot = "graph")
    plot(net, plot = "degree")
    plot(net, plot = "PA")
    plot(net, plot = "fit")



