library(spatstat.utils)


### Name: resolve.defaults
### Title: Determine Values of Variables Using Several Default Rules
### Aliases: resolve.defaults resolve.1.default
### Keywords: programming utilities

### ** Examples

  user <- list(day="Friday")
  ruleA <- list(month="Jan", gravity=NULL)
  ruleB <- list(day="Tuesday", month="May", gravity=42)
  resolve.defaults(user, ruleA, ruleB)
  resolve.defaults(user, ruleA, ruleB, .StripNull=TRUE)
  resolve.defaults(user, ruleA, ruleB, .MatchNull=FALSE)

  resolve.1.default("month", user, ruleA, ruleB)



