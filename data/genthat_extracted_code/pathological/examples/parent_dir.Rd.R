library(pathological)


### Name: parent_dir
### Title: Get the parent dir
### Aliases: parent_dir

### ** Examples

(x <- c(
  sys_which("R"),
  r_home(),
  r_profile_site(),
  "c:/",  # different behaviour under Windows/Unix
  "~",
  "/",
  "foo/bar/nonexistent",
  NA
))
parent_dir(x)



