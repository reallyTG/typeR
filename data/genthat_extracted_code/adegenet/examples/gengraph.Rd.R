library(adegenet)


### Name: gengraph
### Title: Genetic transitive graphs
### Aliases: gengraph gengraph.default gengraph.matrix gengraph.dist
###   gengraph.genind gengraph.genpop gengraph.DNAbin

### ** Examples

if(require(ape)){
    data(woodmouse)
    g <- gengraph(woodmouse, cutoff=5)
    g
    plot(g$graph)

}



