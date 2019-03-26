library(linear.tools)


### Name: paste_formula
### Title: paste a formula as string
### Aliases: paste_formula

### ** Examples


paste_formula(price~carat +cut)
paste_formula(price~carat + cut)

paste_formula(price~carat +cut,exclude_y = TRUE)
paste_formula(Formula = price ~ cut + carat, clean = TRUE)

paste_formula(price~carat +cut - cut, clean = TRUE)

# irregular formulas: cross lines
paste_formula(price~carat +
                cut ~ dsad)

paste_formula(price~carat +
                cut ~ dsad,exclude_y = TRUE)




