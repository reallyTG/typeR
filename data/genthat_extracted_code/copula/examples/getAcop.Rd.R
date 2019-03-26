library(copula)


### Name: getAcop
### Title: Get "acopula" Family Object by Name
### Aliases: getAcop getAname .ac.shortNames .ac.longNames .ac.objNames
###   .ac.classNames
### Keywords: manip

### ** Examples

getAcop("Gumbel")

## different ways of getting the same "acopula" family object:
stopifnot(## Joe (three ways):
          identical(getAcop("J"), getAcop("Joe")),
          identical(getAcop("J"), copJoe),
          ## Frank (yet another two different ways):
          identical(getAcop(frankCopula()), copFrank),
          identical(getAcop("frankCopula"), copFrank))

stopifnot(
  identical(getAname(claytonCopula()), getAname("C")),
  identical(getAname(copClayton), "Clayton"), identical(getAname("J"), "Joe"),
  identical(getAname(amhCopula(), TRUE), "copAMH"),
  identical(getAname(joeCopula(), TRUE), "copJoe")
)

.ac.shortNames
.ac.longNames
.ac.objNames
.ac.classNames



