library(vetr)


### Name: type_of
### Title: A Fuzzier Version of 'typeof()'
### Aliases: type_of

### ** Examples


type_of(1.0001)          # numeric
type_of(1.0)             # integer (`typeof` returns numeric)
type_of(1)               # integer (`typeof` returns numeric)
type_of(sum)             # closure (`typeof` returns builtin)
type_of(`$`)             # closure (`typeof` returns special)



