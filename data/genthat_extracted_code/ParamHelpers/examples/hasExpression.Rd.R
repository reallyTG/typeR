library(ParamHelpers)


### Name: hasExpression
### Title: Check if parameter values contain expressions.
### Aliases: hasExpression

### ** Examples

ps1 = makeParamSet(
  makeNumericParam("x", lower = 1, upper = 2),
  makeNumericParam("y", lower = 1, upper = 10)
)

ps2 = makeParamSet(
  makeNumericLearnerParam("x", lower = 1, upper = 2),
  makeNumericLearnerParam("y", lower = 1, upper = expression(p))
)

hasExpression(ps1)
hasExpression(ps2)



