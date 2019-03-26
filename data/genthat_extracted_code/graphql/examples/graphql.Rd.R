library(graphql)


### Name: graphql2json
### Title: Dump GraphQL Queries to JSON
### Aliases: graphql2json graphql

### ** Examples

graphql2json("{ field(complex: { a: { b: [ $var ] } }) }")
graphql2json("schema { query: QueryType }", TRUE)



