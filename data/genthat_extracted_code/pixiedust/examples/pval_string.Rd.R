library(pixiedust)


### Name: pval_string
### Title: Format P-values for Reports
### Aliases: pval_string pvalString

### ** Examples

 p <- c(1, .999, .905, .505, .205, .125, .09531,
        .05493, .04532, .011234, .0003431, .000000342)
 pvalString(p, format="default")
 pvalString(p, format="exact", digits=3)
 pvalString(p, format="exact", digits=2)
 pvalString(p, format="scientific", digits=3)
 pvalString(p, format="scientific", digits=4)
 



