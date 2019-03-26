library(eikosograms)


### Name: eikos.formula
### Title: Draw eikosogram using a formula to identify response and
###   conditioning variates
### Aliases: eikos.formula

### ** Examples

eikos(Eye ~ Hair + Sex, data=HairEyeColor)
eikos(Hair ~ ., data=HairEyeColor, 
      yaxs = FALSE, ylabs = FALSE,
      legend = TRUE, 
      col = c("black", "sienna4", 
              "orangered", "lightgoldenrod" ))
eikos(Hair ~ ., data=HairEyeColor, xlab_rot = 30,
      yprobs = seq(0.1, 1, 0.1),
      yvals_size = 10,
      xvals_size = 8,
      ispace = list(bottom = 10),
      bottomcol = "grey30", topcol = "grey70",
      lcol = "white")
eikos(Hair ~ ., data=HairEyeColor, xlab_rot = 30,
      marginalize = "Eye",
      yvals_size = 10,
      xvals_size = 8,
      ispace = list(bottom = 10),
      bottomcol = "grey30", topcol = "grey70",
      lcol = "white")
eikos(Hair ~ ., data=HairEyeColor, xlab_rot = 30,
      marginalize = c("Eye", "Sex"),
      yvals_size = 10,
      xvals_size = 8,
      ispace = list(bottom = 10),
      bottomcol = "grey30", topcol = "grey70",
      lcol = "white")




