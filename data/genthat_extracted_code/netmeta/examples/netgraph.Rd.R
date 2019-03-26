library(netmeta)


### Name: netgraph
### Title: Network graph
### Aliases: netgraph
### Keywords: Network meta-analysis Network graph plot

### ** Examples

data(Senn2013)

# Generation of an object of class 'netmeta' with reference treatment 'plac'
#
net1 <- netmeta(TE, seTE, treat1, treat2, studlab,
        data = Senn2013, sm = "MD", reference = "plac")

# Network graph with default settings
#
netgraph(net1)

# Network graph with specified order of the treatments and one
# highlighted comparison
#
trts <- c("plac", "benf", "migl", "acar", "sulf",
          "metf", "rosi", "piog", "sita", "vild")
netgraph(net1, highlight = "rosi:plac", seq = trts)

# Same network graph using argument 'seq' in netmeta function
#
net2 <- netmeta(TE, seTE, treat1, treat2, studlab,
                data = Senn2013, sm = "MD", reference = "plac",
                seq = trts)
netgraph(net2, highlight = "rosi:plac")

# Network graph optimized, starting from a circle, with multi-arm
# study colored
#
netgraph(net1, start = "circle", iterate = TRUE, col.multiarm = "purple")

# Network graph optimized, starting from a circle, with multi-arm
# study colored and all intermediate iteration steps visible
#
## Not run: 
##D netgraph(net1, start = "circle", iterate = TRUE, col.multiarm = "purple",
##D          allfigures = TRUE)
## End(Not run)

# Network graph optimized, starting from Laplacian eigenvectors, with
# multi-arm study colored
#
netgraph(net1, start = "eigen", col.multiarm = "purple")

# Network graph optimized, starting from different Laplacian
# eigenvectors, with multi-arm study colored
#
netgraph(net1, start = "prcomp", col.multiarm = "purple")

# Network graph optimized, starting from random initial layout, with
# multi-arm study colored
#
netgraph(net1, start = "random", col.multiarm = "purple")

# Network graph without plastic look and one highlighted comparison
#
netgraph(net1, plastic = FALSE, highlight = "rosi:plac")

# Network graph without plastic look and comparisons with same
# thickness
netgraph(net1, plastic = FALSE, thickness = FALSE)

# Network graph with changed labels and specified order of the
# treatments
#
netgraph(net1, seq = c(1, 3, 5, 2, 9, 4, 7, 6, 8, 10),
         labels = LETTERS[1:10])

## Not run: 
##D # Network graph in 3-D (opens a new device, where you may rotate and
##D # zoom the plot using the mouse / the mouse wheel).
##D # The rgl package must be installed for 3-D plots.
##D #
##D netgraph(net1, dim = "3d")
## End(Not run)



