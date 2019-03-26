library(tinytex)


### Name: tlmgr
### Title: Run the TeX Live Manager
### Aliases: tlmgr tlmgr_search tlmgr_install tlmgr_remove tlmgr_update
###   tlmgr_path tlmgr_conf

### ** Examples

# search for a package that contains titling.sty
tlmgr_search("titling.sty")

#' to match titling.sty exactly, add a slash before the keyword, e.g.
#' tlmgr_search('/titling.sty')

#' use a regular expression if you want to be more precise, e.g.
#' tlmgr_search('/titling\\.sty$')

# list all installed LaTeX packages
tlmgr(c("info", "--list", "--only-installed", "--data", "name"))



