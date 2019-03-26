library(nseval)


### Name: locate
### Title: Find the environment which defines a name.
### Aliases: locate locate_ locate_.list locate_.quotation
###   locate_.character locate_.( locate_.dots locate_.name

### ** Examples

# Here is how to implement R's `<<-` operator, using `locate_`:
`%<<-%` <- function(lval, rval) {
 lval_ <- arg(lval)
 rval_ <- arg(rval)
 target.env <- locate_(expr(lval_), parent.env(env(lval_)))
 #note that `<-` is a primitive which requires its lvalue and call
 #head to come from teh same env
 env(lval_) <- target.env
 do_(quo(`<-`, target.env), lval_, rval_)
}

x <- "not this one"
local({
  x <- "this one"
  local({
    x <- "not this one either"
    x %<<-% "this works like builtin <<-"
  })
  print(x)
})



