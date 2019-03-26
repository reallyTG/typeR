library(mlrCPO)


### Name: pSS
### Title: Turn the argument list into a 'ParamSet'
### Aliases: pSS pSSLrn

### ** Examples

pSSLrn(a = NA: integer [~0, ]^2 [[requires = expression(b != 0)]],
       b = -10: numeric [~., 0],
       c: discrete [x, y, 1],
       d: logical,
       e: integer)

# is equivalent to

makeParamSet(
    makeIntegerVectorLearnerParam("a", len = 2, lower = 1,  # note exclusive bound
         upper = Inf, requires = expression(b != 0)),
    makeNumericLearnerParam("b", lower = -Inf, upper = 0,
         allow.inf = FALSE, default = -10),  # note infinite value is prohibited.
    makeDiscreteLearnerParam("c", values = list(x = "x", y = "y", `1` = 1)),
    makeLogicalLearnerParam("d"),
    makeIntegerLearnerParam("e"))





