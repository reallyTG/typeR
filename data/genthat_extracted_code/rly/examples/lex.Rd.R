library(rly)


### Name: lex
### Title: Build a lexer
### Aliases: lex

### ** Examples

TOKENS = c('NAME', 'NUMBER')
LITERALS = c('=','+','-','*','/', '(',')')

Lexer <- R6::R6Class("Lexer",
  public = list(
    tokens = TOKENS,
    literals = LITERALS,
    t_NAME = '[a-zA-Z_][a-zA-Z0-9_]*',
    t_NUMBER = function(re='\\d+', t) {
      t$value <- strtoi(t$value)
      return(t)
    },
    t_ignore = " \t",
    t_newline = function(re='\\n+', t) {
       t$lexer$lineno <- t$lexer$lineno + nchar(t$value)
       return(NULL)
    },
    t_error = function(t) {
      cat(sprintf("Illegal character '%s'", t$value[1]))
      t$lexer$skip(1)
      return(t)
    }
  )
)

lexer  <- rly::lex(Lexer)



