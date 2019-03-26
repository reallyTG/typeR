library(wrangle)


### Name: constant.data.frame
### Title: Identify Constant Features of a Data Frame
### Aliases: constant.data.frame

### ** Examples

constant(Theoph)
constant(Theoph, Subject) # Wt Dose
Theoph$Study <- 1
constant(Theoph)
constant(Theoph, Study)
constant(Theoph, Study, Subject)



