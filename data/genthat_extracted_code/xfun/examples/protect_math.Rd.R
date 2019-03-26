library(xfun)


### Name: protect_math
### Title: Protect math expressions in pairs of backticks in Markdown
### Aliases: protect_math

### ** Examples

library(xfun)
protect_math(c("hi $a+b$", "hello $$\\alpha$$", "no math here: $x is $10 dollars"))
protect_math(c("hi $$", "\\begin{equation}", "x + y = z", "\\end{equation}"))



