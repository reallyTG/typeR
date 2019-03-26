library(GRAPE)


### Name: makeBinaryTemplateAndProbabilityTemplate
### Title: Make binary template and probability template
### Aliases: makeBinaryTemplateAndProbabilityTemplate

### ** Examples

submat <- cbind(c(1,3,2,1.5),c(2,3,1.5,1.2),c(1.4,4.2,3.5,3.8))
rownames(submat) <- c("gene_A","gene_B","gene_C","gene_D")
temp <- makeBinaryTemplateAndProbabilityTemplate(submat)
bt <- temp$binary_template; pt <- temp$probability_template
cbind(bt,pt)



