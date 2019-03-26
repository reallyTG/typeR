library(semver)


### Name: render_version
### Title: Render semantic version
### Aliases: render_version render_version.svlist render_version.svptr

### ** Examples

semver <- parse_version(c("1.2.3", "1.2.4", "1.0.0", "1.2.4-beta+2", "2.1.3-alpha", "1.9.4"))
render_version(semver[[4]])
render_version(semver)



