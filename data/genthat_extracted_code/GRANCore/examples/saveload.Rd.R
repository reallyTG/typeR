library(GRANCore)


### Name: loadRepo
### Title: Backwards compatible load utility
### Aliases: loadRepo saveRepo

### ** Examples

repo = GRANRepository(GithubManifest("gmbecker/rpath"), basedir = tempdir())
fil = file.path(tempdir(), "repo.R")
saveRepo(repo, fil)
repo2 = loadRepo(fil)



