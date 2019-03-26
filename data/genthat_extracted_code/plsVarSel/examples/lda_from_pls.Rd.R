library(plsVarSel)


### Name: lda_from_pls
### Title: LDA/QDA classification from PLS model
### Aliases: lda_from_pls

### ** Examples

data(mayonnaise, package = "pls")
mayonnaise <- within(mayonnaise, {dummy <- model.matrix(~y-1,data.frame(y=factor(oil.type)))})
pls <- plsr(dummy ~ NIR, ncomp = 10, data = mayonnaise, subset = train)
with(mayonnaise, {
 classes <- lda_from_pls(pls, oil.type[train], NIR[!train,], 10)
 colSums(oil.type[!train] == classes) # Number of correctly classified out of 42
})




