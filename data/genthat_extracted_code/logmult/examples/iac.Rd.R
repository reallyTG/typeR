library(logmult)


### Name: iac
### Title: Intrinsic Association Coefficient
### Aliases: iac

### ** Examples

  # Altham index (Altham and Ferrie, 2007, Table 1, p. 3 and commentary p. 8)
  tab1 <- matrix(c(260, 195, 158, 70,
                   715, 3245, 874, 664,
                   424, 454, 751, 246,
                   142, 247, 327, 228), 4, 4)
  iac(tab1, weighting="n") * sqrt(nrow(tab1) * ncol(tab1)) * 2

  # Zhou (2015)
  data(hg16)
  # Add 0.5 due to the presence of zero cells
  hg16 <- hg16 + 0.5
  # Figure 3, p. 343: left column then right column
  # (reported values are actually twice the Altham index)
  iac(hg16, weighting="n") * sqrt(nrow(hg16) * ncol(hg16)) * 2 * 2
  iac(hg16, weighting="n", shrink=TRUE) * sqrt(nrow(hg16) * ncol(hg16)) * 2 * 2
  # Table 4, p. 347: values are not exactly the same
  u <- unidiff(hg16)
  # First row
  cor(u$unidiff$layer$qvframe$estimate, iac(hg16, weighting="n"))
  cor(u$unidiff$layer$qvframe$estimate, iac(hg16, weighting="n"), method="spearman")
  # Second row
  cor(u$unidiff$layer$qvframe$estimate, iac(hg16, shrink=TRUE, weighting="n"))
  cor(u$unidiff$layer$qvframe$estimate, iac(hg16, shrink=TRUE, weighting="n"), method="spearman")



