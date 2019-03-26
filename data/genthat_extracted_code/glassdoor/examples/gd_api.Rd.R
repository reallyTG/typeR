library(glassdoor)


### Name: gd_api
### Title: General Glassdoor API function
### Aliases: gd_api

### ** Examples

if (have_gd_pid() && have_gd_pat()) {
res = gd_api(
action = "employers",
other = NULL,
  version = 1,
format = "json",
query =  "pharmaceuticals")

res = gd_api(
action = "employers",
other = NULL,
 version = 1,
format = "json",
query = "pharmaceuticals", config = list())
}



