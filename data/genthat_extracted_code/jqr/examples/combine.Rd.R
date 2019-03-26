library(jqr)


### Name: combine
### Title: Combine json pieces
### Aliases: combine

### ** Examples

x <- '{"foo": 5, "bar": 7}' %>% select(a = .foo)
combine(x)

(x <- commits %>% index() %>%
 select(sha = .sha, name = .commit.committer.name))
combine(x)



