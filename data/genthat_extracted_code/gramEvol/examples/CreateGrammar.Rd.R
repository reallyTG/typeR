library(gramEvol)


### Name: CreateGrammar
### Title: Context-free Grammar Object
### Aliases: CreateGrammar grule gsrule gvrule print.grammar print.GERule

### ** Examples


# Define a simple grammar in BNF format
# <expr> ::= <var><op><var>
# <op>   ::= + | - | *
# <var>  ::= A | B
ruleDef <- list(expr = gsrule("<var><op><var>"),
                op   = gsrule("+", "-", "*"),
                var  = gsrule("A", "B"))

# print rules
print(ruleDef)

# create and display a vector rule
vectorRule = gvrule(1:5)
print(vectorRule)

# Create a grammar object
grammarDef <- CreateGrammar(ruleDef)

# print grammar object
print(grammarDef)

# Creating the same grammar using R expressions
ruleDef <- list(expr = grule(op(var, var)),
                op   = grule(`+`, `-`, `*`),
                var  = grule(A, B))

grammarDef <- CreateGrammar(ruleDef)

print(grammarDef)

# Two rules with commas and assignments, preserved using .()
ruleDef <- list(expr = grule(data.frame(dat)),
                dat  = grule(.(x = 1, y = 2), .(x = 5, y = 6)))
grammarDef <- CreateGrammar(ruleDef)
print(GrammarMap(c(0), grammarDef))
print(GrammarMap(c(1), grammarDef))



