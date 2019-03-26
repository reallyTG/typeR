library(WrightMap)


### Name: make.deltas
### Title: Calculate Master's Delta parameters.
### Aliases: make.deltas make.deltas.default make.deltas.CQmodel
###   make.deltas.character

### ** Examples

fpath <- system.file("extdata", package="WrightMap")

# Partial credit model
model1 <- CQmodel(file.path(fpath,"ex2a.eap"), file.path(fpath,"ex2a.shw")) 
make.deltas(model1)

# Rating scale model
model2 <- CQmodel(file.path(fpath,"ex2b.eap"), file.path(fpath,"ex2b-2.shw")) 
make.deltas(model2)

# Raters, criteria, topics
model3 <- CQmodel(file.path(fpath,"ex4a.mle"), file.path(fpath,"ex4a.shw")) 
make.deltas(model3, item.table = "rater")
make.deltas(model3, item.table = "rater", interactions = "rater*topic", step.table = "topic")



