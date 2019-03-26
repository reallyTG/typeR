library(HH)


### Name: useOuterStripsT2L1
### Title: Three-factor generalization of latticeExtra::useOuterStrips
### Aliases: useOuterStripsT2L1
### Keywords: dplot

### ** Examples

tmp <- data.frame(A=rep(factor(letters[1:2]), each=12),
                  B=rep(factor(letters[3:5]), each=4, times=2),
                  C=rep(factor(letters[6:9]), times=6),
                  x=1:24,
                  y=1:24)

F <- xyplot(y ~ x | B*A*C, data=tmp,
            panel=function(x, y, labels, ...) {
              panel.text(x, y, matrix(1:24, 6, 4, byrow=TRUE)[panel.number()], ...)
            },
            layout=c(6, 4), between=list(x=c(.5, .5, 1.5), y=1))
F

useOuterStripsT2L1(F)




