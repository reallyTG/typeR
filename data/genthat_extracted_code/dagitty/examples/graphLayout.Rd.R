library(dagitty)


### Name: graphLayout
### Title: Generate Graph Layout
### Aliases: graphLayout

### ** Examples

## Generate a layout for the M-bias graph and plot it
plot( graphLayout( dagitty( "dag { X <- U1 -> M <- U2 -> Y } " ) ) )




