library(git2r)


### Name: bundle_r_package
### Title: Bundle bare repo of package
### Aliases: bundle_r_package

### ** Examples

## Not run: 
##D ## Initialize repository
##D path <- tempfile()
##D dir.create(path)
##D path <- file.path(path, "git2r")
##D repo <- clone("https://github.com/ropensci/git2r.git", path)
##D 
##D ## Bundle bare repository in package
##D bundle_r_package(repo)
##D 
##D ## Build and install bundled package
##D wd <- setwd(dirname(path))
##D system(sprintf("R CMD build %s", path))
##D pkg <- list.files(".", pattern = "[.]tar[.]gz$")
##D system(sprintf("R CMD INSTALL %s", pkg))
##D setwd(wd)
##D 
##D ## Reload package
##D detach("package:git2r", unload = TRUE)
##D library(git2r)
##D 
##D ## Summarize last five commits of bundled repo
##D repo <- repository(system.file("git2r.git", package = "git2r"))
##D invisible(lapply(commits(repo, n = 5), summary))
##D 
##D ## Plot content of bundled repo
##D plot(repo)
## End(Not run)



