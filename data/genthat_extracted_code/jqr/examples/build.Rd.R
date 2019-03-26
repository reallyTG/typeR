library(jqr)


### Name: build
### Title: Build arrays and objects
### Aliases: build build_array build_array_ build_object build_object_

### ** Examples

## BUILD ARRAYS
x <- '{"user":"stedolan", "projects": ["jq", "wikiflow"]}' 
jq(x, "[.user, .projects[]]")
x %>% build_array(.user, .projects[])

jq('[1, 2, 3]', '[ .[] | . * 2]')
'[1, 2, 3]' %>% build_array(.[] | . * 2)


## BUILD OBJECTS
'{"foo": 5, "bar": 7}' %>% build_object(a = .foo) %>% peek
'{"foo": 5, "bar": 7}' %>% build_object(a = .foo)

# using json dataset, just first element
x <- commits %>% index(0)
x %>%
   build_object(message = .commit.message, name = .commit.committer.name)
x %>% build_object(sha = .commit.tree.sha, author = .author.login)

# using json dataset, all elements
x <- index(commits)
x %>% build_object(message = .commit.message, name = .commit.committer.name)
x %>% build_object(sha = .sha, name = .commit.committer.name)

# many JSON inputs
'{"foo": 5, "bar": 7} {"foo": 50, "bar": 7} {"foo": 500, "bar": 7}' %>%
  build_object(hello = .foo)



