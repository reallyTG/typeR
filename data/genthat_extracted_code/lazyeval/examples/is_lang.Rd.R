library(lazyeval)


### Name: is_lang
### Title: Is an object a language object?
### Aliases: is_lang is_name is_call is_pairlist is_atomic

### ** Examples

q1 <- quote(1)
is_lang(q1)
is_atomic(q1)

q2 <- quote(x)
is_lang(q2)
is_name(q2)

q3 <- quote(x + 1)
is_lang(q3)
is_call(q3)



