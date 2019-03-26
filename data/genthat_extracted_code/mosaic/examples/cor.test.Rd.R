library(mosaic)


### Name: cor_test.formula
### Title: Alternative formula interface for cor.test
### Aliases: cor_test.formula cor.test cor_test cor_test.default

### ** Examples

# This is an example from example(stats::cor.test) done in old and new style
require(graphics)
cor.test(~ CONT + INTG, data = USJudgeRatings)
cor.test(CONT ~ INTG, data = USJudgeRatings)



