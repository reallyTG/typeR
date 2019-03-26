library(GRANCore)


### Name: available.packages
### Title: available.packages A generic for available.packages and a method
###   for GRANRepository objects
### Aliases: available.packages available.packages,ANY-method
###   available.packages,ANY available.packages,GRANRepository-method
###   available.packages,GRANRepository

### ** Examples

repo = GRANRepository(GithubManifest("gmbecker/fastdigest"), basedir = tempdir())
## none because the repository hasn't been built...
available.packages(repo)



