library(rly)


### Name: yacc
### Title: Build a parser
### Aliases: yacc

### ** Examples

TOKENS = c('NAME', 'NUMBER')
LITERALS = c('=','+','-','*','/', '(',')')

Parser <- R6::R6Class("Parser",
  public = list(
    tokens = TOKENS,
    literals = LITERALS,
    # Parsing rules
    precedence = list(c('left','+','-'),
                      c('left','*','/'),
                      c('right','UMINUS')),
    # dictionary of names
    names = new.env(hash=TRUE),
    p_statement_assign = function(doc='statement : NAME "=" expression', p) {
      self$names[[as.character(p$get(2))]] <- p$get(4)
    },
    p_statement_expr = function(doc='statement : expression', p) {
      cat(p$get(2))
      cat('\n')
    },
    p_expression_binop = function(doc="expression : expression '+' expression
                                                  | expression '-' expression
                                                  | expression '*' expression
                                                  | expression '/' expression", p) {
      if(p$get(3) == '+') p$set(1, p$get(2) + p$get(4))
      else if(p$get(3) == '-') p$set(1, p$get(2) - p$get(4))
      else if(p$get(3) == '*') p$set(1, p$get(2) * p$get(4))
      else if(p$get(3) == '/') p$set(1, p$get(2) / p$get(4))
    },
    p_expression_uminus = function(doc="expression : '-' expression %prec UMINUS", p) {
      p$set(1, -p$get(3))
    },
    p_expression_group = function(doc="expression : '(' expression ')'", p) {
      p$set(1, p$get(3))
    },
    p_expression_number = function(doc='expression : NUMBER', p) {
      p$set(1, p$get(2))
    },
    p_expression_name = function(doc='expression : NAME', p) {
      p$set(1, self$names[[as.character(p$get(2))]])
    },
    p_error = function(p) {
      if(is.null(p)) cat("Syntax error at EOF")
      else           cat(sprintf("Syntax error at '%s'", p$value))
    }
  )
)

parser <- rly::yacc(Parser)



