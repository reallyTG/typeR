library(crunch)


### Name: VariableDefinition
### Title: Construct a variable definition
### Aliases: VariableDefinition VarDef

### ** Examples

VariableDefinition(rnorm(5), name="Some numbers",
    description="Generated pseudorandomly from the normal distribution")
VarDef(name="Integers", values=1:5, type="numeric",
    description="When creating variable definitions with 'values', you must
    specify 'type', and categorical variables will require 'categories'.")



