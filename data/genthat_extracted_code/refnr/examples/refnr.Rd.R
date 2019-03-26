library(refnr)


### Name: refnr
### Title: Refining Data Table using a Set of Formulas
### Aliases: refnr
### Keywords: refinement

### ** Examples

  library(refnr)
  formulas <- rbind(c(Name = "Length",
                      Formula = "Sepal.Length + Petal.Length"),
                    c(Name = "Width",
                      Formula = "Sepal.Width + Petal.Width"))
  res <- refnr(iris, formulas)



