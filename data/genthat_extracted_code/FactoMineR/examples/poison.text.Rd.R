library(FactoMineR)


### Name: poison.text
### Title: Poison
### Aliases: poison.text
### Keywords: datasets

### ** Examples

data(poison.text)
res.text <- textual(poison.text, num.text = 3, contingence.by = c(1,2))
## Contingence table for the sex variable, the sich variable and the couple
## of variable sick-sex
res.text2 <- textual(poison.text, num.text = 3, contingence.by = list(1,2,c(1,2)))



