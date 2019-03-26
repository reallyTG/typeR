library(semver)


### Name: reset_version
### Title: Reset version field
### Aliases: reset_version reset_version.svlist reset_version.svptr

### ** Examples

semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
reset_version(semver[[2]], "major", 1L)
semver[[1]] <- reset_version(semver[[1]], "major", 2L)
reset_version(semver, c("minor", "prerelease"), list(3L, "beta"))
reset_version(semver, c("prerelease"), list("hello", "world"))



