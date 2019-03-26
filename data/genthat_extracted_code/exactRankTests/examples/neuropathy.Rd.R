library(exactRankTests)


### Name: neuropathy
### Title: Acute Painful Diabetic Neuropathy
### Aliases: neuropathy
### Keywords: datasets

### ** Examples

data(neuropathy)
# compare with Table 2 of Conover & Salsburg (1988)
wilcox.exact(pain ~ group, data=neuropathy, alternative="less")
css <- cscores(neuropathy$pain, type="ConSal")
pperm(sum(css[neuropathy$group=="control"]),css,
      m=sum(neuropathy$group=="control"))




