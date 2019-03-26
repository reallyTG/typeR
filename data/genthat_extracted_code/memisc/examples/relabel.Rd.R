library(memisc)


### Name: relabel
### Title: Change labels of factors or labelled objects
### Aliases: relabel relabel.default relabel.factor relabel4
###   relabel4,item-method
### Keywords: manip

### ** Examples

  f <- as.factor(rep(letters[1:4],5))
  levels(f)
  F <- relabel(f,
    a="A",
    b="B",
    c="C",
    d="D"
    )
  levels(F)
  
  f <- as.item(f)
  labels(f)
  F <- relabel(f,
    a="A",
    b="B",
    c="C",
    d="D"
    )
  labels(F)



