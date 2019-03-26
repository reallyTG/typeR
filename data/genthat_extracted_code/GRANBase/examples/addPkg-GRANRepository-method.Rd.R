library(GRANBase)


### Name: addPkg,GRANRepository-method
### Title: addPkg
### Aliases: addPkg,GRANRepository-method

### ** Examples

man = GithubManifest("gmbecker/switchr")
repo = GRANRepository(man, basedir = tempdir())
repo = addPkg(repo, rows = GithubManifest("gmbecker/rpath"))



