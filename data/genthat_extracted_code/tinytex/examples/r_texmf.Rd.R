library(tinytex)


### Name: r_texmf
### Title: Add/remove R's texmf tree to/from TeX Live
### Aliases: r_texmf

### ** Examples

r_texmf("remove")
r_texmf("add")

# all files under R's texmf tree
list.files(file.path(R.home("share"), "texmf"), recursive = TRUE, full.names = TRUE)



