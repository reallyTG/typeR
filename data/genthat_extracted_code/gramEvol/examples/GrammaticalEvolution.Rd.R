library(gramEvol)


### Name: GrammaticalEvolution
### Title: Grammatical Evolution
### Aliases: GrammaticalEvolution print.GrammaticalEvolution

### ** Examples

# Grammar Definition
ruleDef <- list(expr     = gsrule("<der.expr><op><der.expr>"),
                der.expr = grule(func(var), var),
                func     = grule(log, exp, sin, cos),
                op       = gsrule("+", "-", "*"),
                var      = grule(A, B, n),
                n        = grule(1, 2, 3, 4))

# Creating the grammar object
grammarDef <- CreateGrammar(ruleDef)

# cost function
evalFunc <- function(expr) {
  # expr: a string containing a symbolic expression
  # returns: Symbolic regression Error
  A <- 1:6
  B <- c(2, 5, 8, 3, 4, 1)
  
  result <- eval(as.expression(expr))
  
  X <- log(A) * B
  err <- sum((result - X)^2)
  
  return(err)
}

# invoke grammatical evolution (with default parameters)
ge <- GrammaticalEvolution(grammarDef, evalFunc, terminationCost = 0.001)

# print results
print(ge, sequence = TRUE)



