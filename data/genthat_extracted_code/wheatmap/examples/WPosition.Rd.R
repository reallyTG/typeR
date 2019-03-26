library(wheatmap)


### Name: WPosition
### Title: place an arbitrary position w.r.t a subplot
### Aliases: WPosition

### ** Examples


WHeatmap(matrix(rnorm(2000),nrow=40)) +
  WHeatmap(matrix(c(rnorm(100)+1,rnorm(100)), nrow=10),
    cmp=CMPar(brewer.name = 'RdGy'),
    WPosition(0.1,0.1,just=c('left','top')))




