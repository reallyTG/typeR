library(gramEvol)


### Name: GrammaticalRandomSearch
### Title: Random Search
### Aliases: GrammaticalRandomSearch

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

# search and terminate after getting to cost = 0
res <- GrammaticalRandomSearch(grammarDef, evalFunc, terminationCost = 0)

print(res)




