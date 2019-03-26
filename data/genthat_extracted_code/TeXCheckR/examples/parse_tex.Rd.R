library(TeXCheckR)


### Name: parse_tex
### Title: Parse LaTeX lines
### Aliases: parse_tex

### ** Examples

parse_tex(c("A{}", "B[a]{b{c}{d}}z"))
# The version transposed:
#
#>          char : A{}B[a]{b{c}{d}}z
#>           tg1 : 011111122......22
#>           tg2 : 00000000011122222
#>           og1 : 00001111111111111
#>     GROUP_ID1 : .11....222222222.
#>     GROUP_ID2 : .........111222..
#> OPT_GROUP_ID1 : ....111..........



