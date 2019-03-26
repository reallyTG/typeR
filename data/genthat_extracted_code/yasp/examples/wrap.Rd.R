library(yasp)


### Name: wrap
### Title: Wrap strings
### Aliases: wrap dbl_quote sngl_quote bracket brace parens

### ** Examples

wrap("abc", "__")  #  __abc__
parens("abc")      #   (abc)
sngl_quote("abc")  #   'abc'
dbl_quote("abc")   #   "abc"
bracket("abc")     #   [abc]
brace("abc")       #   {abc}

label <- p("name", parens("attribute"))

label             # "name (attribute)"
unparens(label)   # "name attribute"

# make your own function like this:
# markdown bold
bold <- function(...) wrap(paste(...), "**")
p("make a word", bold("bold"))
# see unbold example in ?unwrap



