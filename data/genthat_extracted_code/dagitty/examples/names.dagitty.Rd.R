library(dagitty)


### Name: names.dagitty
### Title: Names of Variables in Graph
### Aliases: names.dagitty

### ** Examples

## A "DAG" with Romanian and Swedish variable names. These can be
## input using quotes to overcome the limitations on unquoted identifiers.
g <- dagitty( 'digraph {
  "coração" [pos="0.297,0.502"]
  "hjärta" [pos="0.482,0.387"]
  "coração" -> "hjärta"
}' )
names( g )



