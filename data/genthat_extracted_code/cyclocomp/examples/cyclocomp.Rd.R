library(cyclocomp)


### Name: cyclocomp
### Title: Cyclomatic Complexity of R Code
### Aliases: cyclocomp cyclocomp-package cyclocomp_q

### ** Examples

## Supply a function
cyclocomp(
  function(arg) { calulate(this); and(that) }
)
cyclocomp(ls)
cyclocomp(cyclocomp)

## Or a quoted expression
cyclocomp(quote( if (condition) "foo" else "bar" ))

## cyclocomp_q quotes the expression for you
cyclocomp_q(while (condition) { loop })

## Complexity of individual control flow constructs
cyclocomp(quote({
  if (condition) this
}))

cyclocomp(quote({
  if (condition) this else that
}))

cyclocomp(quote({
  for (var in seq) expr
}))

cyclocomp(quote({
  while (cond) expr
}))

cyclocomp(quote({
  repeat expr
}))

cyclocomp(quote({
  for (var in seq) {
    this
    break
    that
  }
}))

cyclocomp(quote({
  for (var in seq) {
    this
    next
    that
  }
}))



