library(fso)


### Name: fso
### Title: Fuzzy Set Ordination
### Aliases: fso fso.default fso.formula summary.fso
### Keywords: nonparametric

### ** Examples

    library(labdsv)
    data(bryceveg)
    data(brycesite)
    dis <- dsvdis(bryceveg,'bray/curtis')
    elev.fso <- fso(brycesite$elev,dis)
    elev.fso <- fso(~elev,dis,data=brycesite)
    plot.fso(elev.fso)
    summary(elev.fso)



