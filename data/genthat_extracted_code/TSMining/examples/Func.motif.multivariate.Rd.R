library(TSMining)


### Name: Func.motif.multivariate
### Title: A function to implment the multivariate motif discovery
### Aliases: Func.motif.multivariate

### ** Examples

data(test)
#Perform univariate motif discovery for each dimension in the example data
res.1 <- Func.motif(ts = test$TS1, global.norm = TRUE, local.norm = FALSE,
window.size = 10, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)
res.2 <- Func.motif(ts = test$TS2, global.norm = TRUE, local.norm = FALSE,
window.size = 20, overlap = 0, w = 5, a = 3, mask.size = 3, eps = .01)
#Perform multivaraite motif discovery
res.multi <- Func.motif.multivariate(motif.list = list(res.1$Indices, res.2$Indices),
window.sizes = c(10,20), alpha = .8)



