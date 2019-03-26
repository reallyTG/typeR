## ----example1------------------------------------------------------------
library(semver)
examples <- c("1.0.0", "2.1.3", "1.0.0-alpha", "1.0.0-alpha+1.2", 
              "1.8.2-beta.1.13", "1.8.2-beta.1.10")
sem_versions <- parse_version(examples)
sem_versions
str(sem_versions)

## ----example1a-----------------------------------------------------------
render_version(sem_versions[c(1, 4)])
render_version(sem_versions[[5]])
str(render_version(sem_versions[[5]]))

## ----example2------------------------------------------------------------
sem_versions[[1]] <= sem_versions[[5]]
sem_versions[[1]] > sem_versions[[5]]

# compare example 5, 6 (pre-release ordering matters)
sem_versions[[5]] > sem_versions[[6]]

# compare example 3, 4 (build order does not matter)
sem_versions[[3]] == sem_versions[[4]]

## ----example3------------------------------------------------------------
min(sem_versions)
max(sem_versions)
range(sem_versions)

## ----example4------------------------------------------------------------
sort(sem_versions)
order(sem_versions)
rank(sem_versions)

## ----example4a-----------------------------------------------------------
sem_versions > sem_versions[1]


## ----example5------------------------------------------------------------
sem_versions > "1.1.0-beta"
sem_versions[sem_versions > "1.1.0-beta"]

## ----example6------------------------------------------------------------
library(semver)
examples <- c("1.0.0", "2.1.3", "1.0.0-alpha", "1.0.0-alpha+1.2", 
              "1.8.2-beta.1.13", "1.8.2-beta.1.10")
sem_versions <- parse_version(examples)
set_version(sem_versions[[1]], "major", 2L)
set_version(sem_versions[[1]], "minor", 1L)
set_version(sem_versions[[1]], "patch", 1L)
set_version(sem_versions[[4]], "prerelease", "beta")
set_version(sem_versions[[4]], "build", "bld1a")


## ----example7------------------------------------------------------------
sem_versions[[1]] <- set_version(sem_versions[[1]], "major", 3L)
sem_versions[[1]]

# Syntactic sugar
sem_versions[[1]]$minor <- 2L
sem_versions[[1]]


## ----example8------------------------------------------------------------
examples <- c("1.0.0", "1.8.2-beta.1.10", "2.4.6-8")
sem_versions <- parse_version(examples)
# recycling on the field argument
set_version(sem_versions, "major", list(2L, 4L, 6L))
# recycling on the value argument
set_version(sem_versions, c("major", "minor", "patch"), list(7L))
# assigning integer and character values
set_version(sem_versions, c("prerelease", "minor", "build"), 
            list("alpha", 3L, "build1.12"))

## ----example9------------------------------------------------------------
examples <- c("1.8.2-beta.1.10+somebuild", "2.4.6-8")
sem_versions <- parse_version(examples)
reset_version(sem_versions[[1]], "major", 2L)
reset_version(sem_versions[[1]], "minor", 3L)
reset_version(sem_versions[[1]], "patch", 4L)
reset_version(sem_versions[[1]], "prerelease", "gamma")
reset_version(sem_versions[[1]], "build", "superbuild")

## ----example10-----------------------------------------------------------
examples <- c("1.8.2-beta.1.10+somebuild", "2.4.6-8")
sem_versions <- parse_version(examples)
# recycling on both arguments
reset_version(sem_versions, "major", list(3L))
# recycling on field argument
reset_version(sem_versions, "minor", list(3L, 4L))
# recycling on value argument
reset_version(sem_versions, c("major", "patch"), list(4L))
# assigning integer and character fields
reset_version(sem_versions, c("prerelease", "minor"), list("zeta", 7L))


## ----example11-----------------------------------------------------------
examples <- c("1.8.2-beta.1.10+somebuild", "2.4.6-8")
sem_versions <- parse_version(examples)
# incrementing versions
increment_version(sem_versions[[1]], "major", 1L)
increment_version(sem_versions[[1]], "minor", 2L)
increment_version(sem_versions[[1]], "patch", 3L)
# decrementing versions
increment_version(sem_versions[[1]], "major", -1L)
increment_version(sem_versions[[1]], "minor", -2L)
increment_version(sem_versions[[1]], "patch", -2L)

## ----example12-----------------------------------------------------------
examples <- c("1.8.2-beta.1.10+somebuild", "2.4.6-8")
sem_versions <- parse_version(examples)
## Incrementing
# recycling on both arguments
increment_version(sem_versions, "major", 3L)
# recycling on field argument
increment_version(sem_versions, "minor", c(3L, 4L))
# recycling on value argument
increment_version(sem_versions, c("major", "patch"), 4L)
## Decrementing
# recycling on both arguments
increment_version(sem_versions, "major", -1L)
# recycling on field argument
increment_version(sem_versions, "minor", c(-3L, -4L))
# recycling on value argument
increment_version(sem_versions, c("minor"), -4L)


