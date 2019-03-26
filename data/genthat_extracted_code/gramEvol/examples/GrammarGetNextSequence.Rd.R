library(gramEvol)


### Name: GrammarGetNextSequence
### Title: Grammar Iterator
### Aliases: GrammarGetNextSequence GrammarGetFirstSequence
###   is.GrammarOverflow print.GrammarOverflow

### ** Examples

# Define a simple grammar
# <expr> ::= <var><op><var>
# <op>   ::= + | - | *
# <var>  ::= A | B
ruleDef <- list(expr = gsrule("<var><op><var>"),
                op   = gsrule("+", "-", "*"),
                var  = gsrule("A", "B"))

# Create a grammar object
grammarDef <- CreateGrammar(ruleDef)			   

# Iterate and print all valid sequence and expressions
string <- NULL
while (TRUE) {
  string <- GrammarGetNextSequence(grammarDef, string)

  if (is.GrammarOverflow(string)) {
    break
  }

  expr <- GrammarMap(string, grammarDef)
  cat(string, " -> ", as.character(expr), "\n")
}

# test a partial string
GrammarGetNextSequence(grammarDef, c(0, 0, 2))




