library(ztable)


### Name: ztable2flextable
### Title: Convert an object of ztable into an object of flextable
### Aliases: ztable2flextable

### ** Examples

require(magrittr)
z=ztable(head(mtcars)) %>%
   addRowColor(rows=1:7,palette2colors("Paired"))
z=ztable(head(mtcars))
z
ztable2flextable(z)



