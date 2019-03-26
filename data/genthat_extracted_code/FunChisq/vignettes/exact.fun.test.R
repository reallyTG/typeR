## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
require(FunChisq)
# x is a contingency table with row variable for p53 mutation and
#   column variable for CIMP
x <- matrix(c(12,26,18,0,8,12), nrow=2, ncol=3, byrow=TRUE)
x
# Test the functional dependency: p53 mutation -> CIMP
res <- fun.chisq.test(x, method="exact")
print(res)
pval.text <- format.pval(res$p.value, digits=2)
xif.text <- format.pval(res$estimate, digits=2)
plot_table(
  x, xlab="CIMP", ylab="p53 mutation", col="seagreen3",
  main=bquote(italic(P)~'='~.(pval.text)*','~~italic(xi[f])~'='~.(xif.text)))

