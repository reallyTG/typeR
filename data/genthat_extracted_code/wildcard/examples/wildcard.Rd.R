library(wildcard)


### Name: wildcard
### Title: Function 'wildcard'
### Aliases: wildcard

### ** Examples

myths <- data.frame(
  myth = c('Bigfoot', 'UFO', 'Loch Ness Monster'),
  claim = c('various', 'day', 'day'),
 note = c('various', 'pictures', 'reported day'))
wildcard(myths, wildcard = 'day', values = c('today', 'yesterday'))
wildcard(myths, wildcard = 'day', values = c('today', 'yesterday'),
  expand = FALSE)
locations <- data.frame(
  myth = c('Bigfoot', 'UFO', 'Loch Ness Monster'),
  origin = 'where')
rules <- list(
  where = c('North America', 'various', 'Scotland'),
  UFO = c('spaceship', 'saucer'))
wildcard(locations, rules = rules, expand = c(FALSE, TRUE))
numbers <- data.frame(x = 4, y = 3, z = 4444, w = 4.434)
wildcard(numbers, wildcard = 4, values = 7)
# Inclusion and exclusion
wildcard(myths, wildcard = "day", values = c("today", "yesterday"),
  include = "claim")
wildcard(myths, wildcard = "day", values = c("today", "yesterday"),
  exclude = c("claim", "note"))
# Wildcards should not also be replacement values.
# Otherwise, the output will be strange
# and will depend on the order of the wildcards.
## Not run: 
##D df <- data.frame(x = "a", y = "b")
##D rules <- list(a = letters[1:3], b = LETTERS[1:3])
##D wildcard(df, rules = rules)
## End(Not run)



