library(semver)


### Name: parse_version
### Title: Parse semantic version
### Aliases: parse_version

### ** Examples

semver <- parse_version(c("1.2.3", "1.2.4", "1.0.0", "1.2.4-beta", "2.1.3-alpha", "1.9.4"))
max(semver)
ver124a <- semver[semver > "1.2.4-alpha"]
sort(ver124a)
# compare versions
semver[[1]] < semver[[2]]

# compare against a version
semver > semver[1]

# compare against a character string
semver > "1.7.2"

# sort versions
sort(semver)
order(semver)
rank(semver)

# get summary statistics
min(semver)
max(semver)
range(semver)

# coerce versions
as.character(semver)
as.data.frame(semver)



