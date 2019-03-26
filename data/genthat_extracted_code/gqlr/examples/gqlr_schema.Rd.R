library(gqlr)


### Name: gqlr_schema
### Title: Create Schema definitions
### Aliases: gqlr_schema

### ** Examples

library(magrittr)

## Set up data
add_human <- function(human_data, id, name, appear, home, friend) {
  human <- list(id = id, name = name, appearsIn = appear, friends = friend, homePlanet = home)
  # set up a function to be calculated if the field totalCredits is required
  human$totalCredits <- function(obj, args, schema) {
    length(human$appearsIn)
  }
  human_data[[id]] <- human
  human_data
}
add_droid <- function(droid_data, id, name, appear, pf, friend) {
  droid <- list(id = id, name = name, appearsIn = appear, friends = friend, primaryFunction = pf)
  # set extra fields manually
  droid$totalCredits <- length(droid$appearsIn)
  droid_data[[id]] <- droid
  droid_data
}

human_data <- list() %>%
  add_human("1000", "Luke Skywalker", c(4, 5, 6), "Tatooine", c("1002", "1003", "2000", "2001")) %>%
  add_human("1002", "Han Solo",       c(4, 5, 6), "Corellia", c("1000", "1003", "2001")) %>%
  add_human("1003", "Leia Organa",    c(4, 5, 6), "Alderaan", c("1000", "1002", "2000", "2001"))

droid_data <- list() %>%
  add_droid("2000", "C-3PO", c(4, 5, 6), "Protocol", c("1000", "1002", "1003", "2001")) %>%
  add_droid("2001", "R2-D2", c(4, 5, 6), "Astromech", c("1000", "1002", "1003"))

all_characters <- list() %>% append(human_data) %>% append(droid_data) %>% print()
## End data set up



# Define the schema using GraphQL code
star_wars_schema <- Schema$new()

"
enum Episode { NEWHOPE, EMPIRE, JEDI }
" %>%
  gqlr_schema(
    Episode = list(
      resolve = function(episode_id, schema) {
        switch(as.character(episode_id),
          "4" = "NEWHOPE",
          "5" = "EMPIRE",
          "6" = "JEDI",
          "UNKNOWN_EPISODE"
        )
      }
    )
  ) ->
episode_schema
# display the schema
episode_schema$get_schema()
# add the episode definitions to the Star Wars schema
star_wars_schema$add(episode_schema)


"
interface Character {
  id: String!
  name: String
  friends: [Character]
  appearsIn: [Episode]
}
" %>%
  gqlr_schema(
    Character = list(
      resolve_type = function(id, schema) {
        if (id %in% names(droid_data)) {
          "Droid"
        } else {
          "Human"
        }
      }
    )
  ) ->
character_schema
# print the Character schema with no extra formatting
character_schema$get_schema() %>% format() %>% cat("\n")
star_wars_schema$add(character_schema)


"
type Droid implements Character {
  id: String!
  name: String
  friends: [Character]
  appearsIn: [Episode]
  primaryFunction: String
}
type Human implements Character {
  id: String!
  name: String
  friends: [Character]
  appearsIn: [Episode]
  homePlanet: String
}
" %>%
  gqlr_schema(
    Human = list(
      # Add a resolve method for type Human that takes in an id and returns the human data
      resolve = function(id, args, schema) {
        human_data[[id]]
      }
    ),
    Droid = list(
      # description for Droid
      description = "A mechanical creature in the Star Wars universe.",
      # Add a resolve method for type Droid that takes in an id and returns the droid data
      resolve = function(id, schema) {
        droid_data[[id]]
      }
    )
  ) ->
human_and_droid_schema
human_and_droid_schema$get_schema()
star_wars_schema$add(human_and_droid_schema)


"
type Query {
  hero(episode: Episode): Character
  human(id: String!): Human
  droid(id: String!): Droid
}
# the schema type must be provided if a query or mutation is to be executed
schema {
  query: Query
}
" %>%
  gqlr_schema(
    Query = function(null, schema) {
      list(
        # return a function for key 'hero'
        # the id will be resolved by the appropriate resolve() method of Droid or Human
        hero = function(obj, args, schema) {
          episode <- args$episode
          if (identical(episode, 5) || identical(episode, "EMPIRE")) {
            luke$id
          } else {
            artoo$id
          }
        },
        # the id will be resolved by the Human resolve() method
        human = function(obj, args, schema) {
          args$id
        },
        # the id will be resolved by the Droid resolve() method
        droid = function(obj, args, schema) {
          args$id
        }
      )
    }
  ) ->
schema_def
# print Schema with no extra formatting
schema_def$get_schema() %>% format() %>% cat("\n")
star_wars_schema$add(schema_def)


# view the final schema definitiion
star_wars_schema$get_schema()



