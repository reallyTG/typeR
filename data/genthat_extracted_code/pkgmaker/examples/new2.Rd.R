library(pkgmaker)


### Name: new2
### Title: Alternative S4 Constructor
### Aliases: new2

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


setClass('A', contain='character', representation(x='numeric', y='character'))

# identical behaviour with standard calls
identical(new('A'), new2('A'))
identical(new('A', x=1), new2('A', x=1))

# but if passing that are names not slots 
identical(new('A'), new2('A', b=1))
identical(new('A', x=1), new2('A', x=1, b=3))
identical(new('A', x=1), new2('A', x=1, b=3))

# standard `new` would coerce first unnamed argument into parent of 'A' (i.e. 'character') 
new('A', list(x=1))
new('A', list(x=1, y='other'))
# `new2` rather use it to initialise the slots it can find in the list 
identical(new('A', x=1), new2('A', list(x=1)))
identical(new('A', x=1, y='other'), new2('A', list(x=1, y='other')))





