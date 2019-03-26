library(tableschema.r)


### Name: infer
### Title: Infer source schema
### Aliases: infer

### ** Examples

# list of lists data source
source = list(
             list("id"= 1,
                  "age"= 39,
                  "name"= "Paul"),
             list("id"= 2,
                  "age"= 23,
                  "name"= "Jimmy"),
             list("id"= 3,
                  "age"= 36,
                  "name"= "Jane"),
             list("id"= 4,
                  "age"= 28,
                  "name"= "Judy"))

infer(source, options=list(headers=list("id","age","name")))$fields




