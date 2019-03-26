library(polmineR)


### Name: kwic
### Title: KWIC/concordance output.
### Aliases: kwic kwic,context-method kwic,partition-method
###   kwic,character-method

### ** Examples

use("polmineR")
K <- kwic("GERMAPARLMINI", "Integration")
K <- kwic(
  "GERMAPARLMINI",
  "Integration", left = 20, right = 20,
  s_attributes = c("date", "speaker", "party")
)
K <- kwic(
  "GERMAPARLMINI",
  '"Integration" [] "(Menschen|Migrant.*|Personen)"', cqp = TRUE,
  left = 20, right = 20,
  s_attributes = c("date", "speaker", "party")
)

K <- kwic(
  "GERMAPARLMINI",
  '"Sehr" "geehrte"', cqp = TRUE,
  boundary = "date"
)

P <- partition("GERMAPARLMINI", date = "2009-11-10")
K <- kwic(P, query = "Integration")
K <- kwic(P, query = '"Sehr" "geehrte"', cqp = TRUE, boundary = "date")



