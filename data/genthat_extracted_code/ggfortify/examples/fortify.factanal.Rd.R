library(ggfortify)


### Name: fortify.factanal
### Title: Convert 'stats::factanal' to 'data.frame'
### Aliases: fortify.factanal

### ** Examples

d.factanal <- stats::factanal(state.x77, factors = 3, scores = 'regression')
fortify(d.factanal)
fortify(d.factanal, data = state.x77)



