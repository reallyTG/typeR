library(FastRWeb)


### Name: oinput
### Title: Functions aiding in creating HTML form elements.
### Aliases: oselection oinput osubmit
### Keywords: interface

### ** Examples

run <- function(foo, fruit, ...) {
  fruits <- c("apples", "oranges", "pears")
  if (!missing(fruit))
    out("Thank you for choosing ", fruits[as.integer(fruit)],"!<p>")

  out("<form>")
  out("Foo:")
  oinput("foo", foo)
  out("<br>Select fruit:")
  oselection("fruit", fruits, seq.int(fruits), , fruit)
  out("<br>")
  osubmit()
  out("</form>")
  done()
}



