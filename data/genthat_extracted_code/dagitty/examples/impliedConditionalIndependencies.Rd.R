library(dagitty)


### Name: impliedConditionalIndependencies
### Title: List Implied Conditional Independencies
### Aliases: impliedConditionalIndependencies

### ** Examples

g <- dagitty( "dag{ x -> m -> y }" )
impliedConditionalIndependencies( g ) # one
latents( g ) <- c("m")
impliedConditionalIndependencies( g ) # none



