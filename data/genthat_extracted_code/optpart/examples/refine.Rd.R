library(optpart)


### Name: refine
### Title: Refining a Classification by Re-Assigning Memberships
### Aliases: refine refine.default refine.pco refine.nmds
### Keywords: cluster

### ** Examples

    ## Not run: data(shoshveg)
    ## Not run: dis.bc <- dsvdis(shoshveg,'bray')
    ## Not run: opt.5 <- optpart(5,dis.bc)
    ## Not run: nmds.bc <- nmds(dis.bc)
    ## Not run: plot(nmds.bc)
    ## Not run: res <- refine(nmds.bc,opt.5)



