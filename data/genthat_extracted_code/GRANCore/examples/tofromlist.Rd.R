library(GRANCore)


### Name: RepoToList
### Title: Transform a GRANRepository object into a list
### Aliases: RepoToList RepoFromList

### ** Examples

repo = GRANRepository(GithubManifest("gmbecker/switchr"), basedir = tempdir())
lst = RepoToList(repo)
repo2 = RepoFromList(lst)



