library(PKNCA)


### Name: parseFormula
### Title: Parse a formula into its component parts.
### Aliases: parseFormula

### ** Examples

parseFormula("a~b", require.groups=FALSE)
## parseFormula("a~b", require.groups=TRUE) # This is an error
parseFormula("a~b|c")
parseFormula("a~b|c")$groups



