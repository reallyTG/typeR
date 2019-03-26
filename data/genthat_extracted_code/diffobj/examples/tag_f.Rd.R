library(diffobj)


### Name: tag_f
### Title: Make Functions That Wrap Text in HTML Tags
### Aliases: tag_f div_f, span_f, cont_f div_f span_f cont_f

### ** Examples

## Assuming class 'ex1' has CSS styles defined elsewhere
tag_f("div", "ex1")(LETTERS[1:5])
## Use convenience function, and add some inline styles
div_f("ex2", c(color="green", `font-family`="arial"))(LETTERS[1:5])
## Notice how this is a div with pre-specifed class,
## and only one div is created around the entire data
cont_f()(LETTERS[1:5])



