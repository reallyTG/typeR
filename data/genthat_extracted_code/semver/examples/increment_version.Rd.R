library(semver)


### Name: increment_version
### Title: Increment version field
### Aliases: increment_version increment_version.svlist
###   increment_version.svptr

### ** Examples

semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
increment_version(semver[[2]], "major", 1L)
increment_version(semver[[2]], "major", -1L)
increment_version(semver, c("minor", "patch"), c(3L, 9L))
increment_version(semver, c("minor", "patch"), c(-1L, -3L))
increment_version(semver, c("minor"), 1L)



