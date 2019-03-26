library(flexmix)


### Name: salmonellaTA98
### Title: Salmonella Reverse Mutagenicity Assay
### Aliases: salmonellaTA98
### Keywords: datasets

### ** Examples

data("salmonellaTA98", package = "flexmix")
salmonMix <- initFlexmix(y ~ 1,
                         data = salmonellaTA98, 
                         model = FLXMRglmfix(family = "poisson", 
                           fixed = ~ x + log(x + 10)),                        
                         k = 2, nrep = 5)
salmonMix.pr <- predict(salmonMix, newdata = salmonellaTA98)
plot(y ~ x, data = salmonellaTA98, 
     pch = as.character(clusters(salmonMix)), 
     ylim = range(c(salmonellaTA98$y, unlist(salmonMix.pr))))
for (i in 1:2) lines(salmonellaTA98$x, salmonMix.pr[[i]], lty = i)



