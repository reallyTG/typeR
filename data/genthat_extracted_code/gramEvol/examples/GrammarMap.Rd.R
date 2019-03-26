library(gramEvol)


### Name: GrammarMap
### Title: Sequence to Expression Mapping using Context-free Grammar
### Aliases: GrammarMap GrammarGenotypeToPhenotype as.character.GEPhenotype
###   as.expression.GEPhenotype print.GEPhenotype

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

# this should create the expression "A - C"
# <expr>         -> 0 -> <var><op><var>
# <var><op><var> -> 0 -> A<op><var>
# A<op><var>     -> 1 -> A - <var>
# A - <var>      -> 2 -> A - C
sq <- c(0, 0, 1, 2)
expr <- GrammarMap(sq, grammarDef, verbose = TRUE)

print(expr)

# check the expression as a character string
stopifnot(as.character(expr) == "A - C")

# evaluate the expression
A = 5; C = 1
eval(as.expression(expr))



