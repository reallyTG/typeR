library(spatstat)


### Name: Kmark
### Title: Mark-Weighted K Function
### Aliases: Kmark markcorrint
### Keywords: spatial nonparametric

### ** Examples

    # CONTINUOUS-VALUED MARKS:
    # (1) Spruces
    # marks represent tree diameter
    # mark correlation function
    ms <- Kmark(spruces)
    plot(ms)

    # (2) simulated data with independent marks
    X <- rpoispp(100)
    X <- X %mark% runif(npoints(X))
    Xc <- Kmark(X)
    plot(Xc)
    
    # MULTITYPE DATA:
    # Hughes' amacrine data
    # Cells marked as 'on'/'off'
    M <- Kmark(amacrine, function(m1,m2) {m1==m2},
                         correction="translate")
    plot(M)



