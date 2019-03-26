library(labdsv)


### Name: nmds
### Title: Nonmetric Multidimensional Scaling
### Aliases: nmds bestnmds
### Keywords: multivariate

### ** Examples

    data(bryceveg)
    data(brycesite)
    dis.man <- dist(bryceveg,method="manhattan")
    demo.nmds <- nmds(dis.man,k=4)
    plot(demo.nmds)
    points(demo.nmds,brycesite$elev>8000)
    plotid(demo.nmds,ids=row.names(brycesite))



