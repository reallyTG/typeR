library(mice)


### Name: construct.blocks
### Title: Construct blocks from 'formulas' and 'predictorMatrix'
### Aliases: construct.blocks

### ** Examples

form <- name.formulas(list(bmi + hyp ~ chl + age, chl ~ bmi))
pred <- make.predictorMatrix(nhanes[, c("age", "chl")])
construct.blocks(formulas = form, pred = pred)



