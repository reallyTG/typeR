library(withr)


### Name: withr
### Title: Execute code in temporarily altered environment
### Aliases: withr withr-package

### ** Examples

getwd()
with_dir(tempdir(), getwd())
getwd()

Sys.getenv("WITHR")
with_envvar(c("WITHR" = 2), Sys.getenv("WITHR"))
Sys.getenv("WITHR")

with_envvar(c("A" = 1),
  with_envvar(c("A" = 2), action = "suffix", Sys.getenv("A"))
)

# local variants are best used within other functions
f <- function(x) {
  local_envvar(c("WITHR" = 2))
  Sys.getenv("WITHR")
}
Sys.getenv("WITHR")



