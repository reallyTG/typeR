library(GRANCore)


### Name: contrib.url
### Title: contrib.url A generic for contrib.url so that available.packages
###   et al can interact with GRANRepository objects.
### Aliases: contrib.url contrib.url,GRANRepository-method
###   contrib.url,GRANRepository

### ** Examples

repo = GRANRepository(GithubManifest("gmbecker/fastdigest"), basedir = tempdir())
contrib.url(repo)



