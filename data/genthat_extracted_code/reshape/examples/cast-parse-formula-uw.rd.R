library(reshape)


### Name: cast_parse_formula
### Title: Cast parse formula
### Aliases: cast_parse_formula
### Keywords: internal

### ** Examples
cast_parse_formula("a + ...", letters[1:6])
cast_parse_formula("a | ...", letters[1:6])
cast_parse_formula("a + b ~ c ~ . | ...", letters[1:6])


