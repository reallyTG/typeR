library(gramEvol)


### Name: summary
### Title: Context-free Grammar Object Information
### Aliases: summary.grammar print.summary.grammar GrammarStartSymbol
###   GrammarGetDepth GrammarMaxRuleSize GrammarMaxSequenceLen
###   GrammarNumOfExpressions GrammarIsRecursive GrammarMaxSequenceRange
###   GetGrammarDepth GetGrammarMaxRuleSize GetGrammarMaxSequenceLen
###   GetGrammarNumOfExpressions

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

# summarize grammar object
summary(grammarDef)



