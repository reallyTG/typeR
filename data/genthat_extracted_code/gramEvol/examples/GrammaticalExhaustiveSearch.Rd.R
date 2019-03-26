library(gramEvol)


### Name: GrammaticalExhaustiveSearch
### Title: Exhaustive Search
### Aliases: GrammaticalExhaustiveSearch print.GESearch

### ** Examples

library("gramEvol")

ruleDef <- list(expr = gsrule("<var><op><var>"),
                op   = gsrule("+", "-", "*"),
                var  = gsrule("A", "B"))

# Create a grammar object
grammarDef <- CreateGrammar(ruleDef)         


# use exhaustive search to find the sequence for creating "B - A"
evalFunc <- function(expr) {
  if (as.character(expr) == "B - A") {
    return(0) # Minimum error
  } else {
    return(1) # maximum error
  }
}

res <- GrammaticalExhaustiveSearch(grammarDef, evalFunc, terminationCost = 0)

print(res)




