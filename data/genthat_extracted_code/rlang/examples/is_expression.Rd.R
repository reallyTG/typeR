library(rlang)


### Name: is_expression
### Title: Is an object an expression?
### Aliases: is_expression is_syntactic_literal is_symbolic

### ** Examples

q1 <- quote(1)
is_expression(q1)
is_syntactic_literal(q1)

q2 <- quote(x)
is_expression(q2)
is_symbol(q2)

q3 <- quote(x + 1)
is_expression(q3)
is_call(q3)


# Atomic expressions are the terminating nodes of a call tree:
# NULL or a scalar atomic vector:
is_syntactic_literal("string")
is_syntactic_literal(NULL)

is_syntactic_literal(letters)
is_syntactic_literal(quote(call()))

# Parsable literals have the property of being self-quoting:
identical("foo", quote("foo"))
identical(1L, quote(1L))
identical(NULL, quote(NULL))

# Like any literals, they can be evaluated within the empty
# environment:
eval_bare(quote(1L), empty_env())

# Whereas it would fail for symbolic expressions:
# eval_bare(quote(c(1L, 2L)), empty_env())


# Pairlists are also language objects representing argument lists.
# You will usually encounter them with extracted formals:
fmls <- formals(is_expression)
typeof(fmls)

# Since they are mostly an internal data structure, is_expression()
# returns FALSE for pairlists, so you will have to check explicitly
# for them:
is_expression(fmls)
is_pairlist(fmls)



