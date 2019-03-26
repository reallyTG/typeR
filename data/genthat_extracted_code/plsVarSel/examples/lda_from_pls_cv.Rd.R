library(plsVarSel)


### Name: lda_from_pls_cv
### Title: Cross-validated LDA/QDA classification from PLS model
### Aliases: lda_from_pls_cv

### ** Examples

data(mayonnaise, package = "pls")
mayonnaise <- within(mayonnaise, {dummy <- model.matrix(~y-1,data.frame(y=factor(oil.type)))})
pls <- plsr(dummy ~ NIR, ncomp = 8, data = mayonnaise, subset = train, 
            validation = "CV", segments = 40, segment.type = "consecutive")
with(mayonnaise, {
 classes <- lda_from_pls_cv(pls, NIR[train,], oil.type[train], 8)
 colSums(oil.type[train] == classes) # Number of correctly classified out of 120
})




