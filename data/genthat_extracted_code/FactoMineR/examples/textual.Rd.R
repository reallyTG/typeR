library(FactoMineR)


### Name: textual
### Title: Text mining
### Aliases: textual
### Keywords: multivariate

### ** Examples

data(poison.text)
res.text <- textual(poison.text, num.text = 3, contingence.by = 1)
descfreq(res.text$cont.table)
## Contingence table for the couple of variable sick-sex
res.text2 <- textual(poison.text, num.text = 3, contingence.by = list(c(1,2)))
descfreq(res.text2$cont.table)
## Contingence table for sex, sick and the couple of variable sick-sex
res.text2 <- textual(poison.text, num.text = 3, contingence.by = list(1,2,c(1,2)))



