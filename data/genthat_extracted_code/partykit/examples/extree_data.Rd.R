library(partykit)


### Name: extree_data
### Title: Data Preprocessing for Extensible Trees.
### Aliases: extree_data
### Keywords: tree

### ** Examples


  data("iris")

  ed <- extree_data(Species ~ Sepal.Width + Sepal.Length | Petal.Width + Petal.Length, 
                    data = iris, nmax = c("yx" = 25, "z" = 10), yx = "matrix")

  ### the model.frame
  mf <- model.frame(ed)
  all.equal(mf, iris[, names(mf)])

  ### binned y ~ x part
  model.frame(ed, yxonly = TRUE)

  ### binned Petal.Width
  ed[[4, type = "index"]]

  ### response
  ed$yx$y

  ### model matrix 
  ed$yx$x




