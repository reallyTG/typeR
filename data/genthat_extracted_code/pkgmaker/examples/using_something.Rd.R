library(pkgmaker)


### Name: using_something
### Title: Execute code in temporarily altered environment.
### Aliases: using_something using_envvar using_env using_locale
###   using_collate using_dir using_libpaths using_lib using_options
###   using_par using_path

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)

getwd()
using_dir(tempdir(), getwd())
getwd()

Sys.getenv("HADLEY")
using_envvar(c("HADLEY" = 2), Sys.getenv("HADLEY"))
Sys.getenv("HADLEY")

using_envvar(c("A" = 1),
  using_envvar(c("A" = 2), action = "suffix", Sys.getenv("A"))
)



