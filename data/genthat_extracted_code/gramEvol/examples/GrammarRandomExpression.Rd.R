library(gramEvol)


### Name: GrammarRandomExpression
### Title: Random Expression Generation
### Aliases: GrammarRandomExpression

### ** Examples

# Define a simple grammar
# <expr> ::= <var><op><var>
# <op>   ::= + | - | *
# <var>  ::= A | B | C
ruleDef <- list(expr = gsrule("<var><op><var>"),
                op =   gsrule("+", "-", "*"),
                var =  grule(A, B, C))

# Create a grammar object
grammarDef <- CreateGrammar(ruleDef)

# Generate 5 random expressions
exprs <- GrammarRandomExpression(grammarDef, 5)
print(exprs)



