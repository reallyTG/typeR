library(re2r)


### Name: get_named_groups
### Title: Return capturing names for a pre-compiled regular expression.
### Aliases: get_named_groups

### ** Examples

get_named_groups(re2("(a)(?P<name>b)"))

regexp = re2("(?P<A>exprA(?P<B>exprB)(?P<C>exprC))((expr5)(?P<D>exprD))")

print(regexp)
(res = get_named_groups(regexp))
re2_match("exprAexprBexprCexpr5exprD", regexp)



