library(miceadds)


### Name: VariableNames2String
### Title: Stringing Variable Names with Line Breaks
### Aliases: VariableNames2String

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example
#############################################################################

data(data.ma01)
# extract variable names
vars <- colnames(data.ma01)
# convert into a long string with line breaks at column 25
vars2 <- miceadds::VariableNames2String( vars, breaks=25)
vars
  ##   [1] "idstud"   "idschool" "studwgt"  "math"     "read"     "migrant"
  ##   [7] "books"    "hisei"    "paredu"   "female"   "urban"
vars2
  ##  idstud idschool studwgt
  ##  math read migrant books
  ##  hisei paredu female
  ##  urban



