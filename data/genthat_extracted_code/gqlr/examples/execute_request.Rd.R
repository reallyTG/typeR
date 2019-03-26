library(gqlr)


### Name: execute_request
### Title: Execute GraphQL server response
### Aliases: execute_request

### ** Examples


# bare bones
schema <- gqlr_schema("
  type Person {
    name: String
    friends: [Person]
  }
  schema {
    query: Person
  }
")

data <- list(
  name = "Barret",
  friends = list(
    list(name = "Ryan", friends = list(list(name = "Bill"), list(name = "Barret"))),
    list(name = "Bill", friends = list(list(name = "Ryan")))
  )
)

ans <- execute_request("{ name }", schema, initial_value = data)
ans$as_json()

execute_request("
  {
    name
    friends {
      name
      friends {
        name
        friends {
          name
        }
      }
    }
  }",
  schema,
  initial_value = data
)$as_json()






# Using resolve method to help with recursion
people <- list(
  "id_Barret" = list(name = "Barret", friends = list("id_Ryan", "id_Bill")),
  "id_Ryan" = list(name = "Ryan", friends = list("id_Barret", "id_Bill")),
  "id_Bill" = list(name = "Bill", friends = list("id_Ryan"))
)
schema <- gqlr_schema("
    type Person {
      name: String
      friends: [Person]
    }
    schema {
      query: Person
    }
  ",
  Person = list(
    resolve = function(name, schema, ...) {
      if (name %in% names(people)) {
        people[[name]]
      } else {
        NULL
      }
    }
  )
)

ans <- execute_request("{ name }", schema, initial_value = "id_Barret")
ans$as_json()

execute_request("
  {
    name
    friends {
      name
      friends {
        name
        friends {
          name
        }
      }
    }
  }",
  schema,
  initial_value = "id_Barret"
)$as_json()



