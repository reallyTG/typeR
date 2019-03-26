library(gramEvol)


### Name: GrammarIsTerminal
### Title: Non-terminal Phenotype test.
### Aliases: GrammarIsTerminal

### ** Examples

# Define a recursive grammar
# <expr> ::= <expr>+<expr> | var
# <var>  ::= A | B | C
ruleDef <- list(expr = grule(expr+expr, var),
                var =  grule(A, B, C))

# Create a grammar object
grammarDef <- CreateGrammar(ruleDef)

# a short sequence leading to infinite recursion
sq <- c(0)
expr <- GrammarMap(sq, grammarDef)

print(expr)

# check the phenotype for being non-terminal
print(GrammarIsTerminal(expr))


# a terminal sequence
sq <- c(0, 1, 0, 1, 2)
expr <- GrammarMap(sq, grammarDef)

print(expr)
print(GrammarIsTerminal(expr))



