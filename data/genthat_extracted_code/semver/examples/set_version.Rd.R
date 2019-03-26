library(semver)


### Name: set_version
### Title: Set version field
### Aliases: set_version set_version.svlist set_version.svptr

### ** Examples

semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
semver[[1]] <- set_version(semver[[1]], "major", 2L)
set_version(semver, c("prerelease", "build"), list("hello"))
set_version(semver, c("prerelease"), list("hello", "world"))



