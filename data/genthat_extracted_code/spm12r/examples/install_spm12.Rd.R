library(spm12r)


### Name: install_spm12
### Title: Install SPM12 file into directory
### Aliases: install_spm12

### ** Examples

tdir = tempfile()
dir.create(tdir)
in_ci <- function() {
nzchar(Sys.getenv("CI"))
}
if (.Platform$OS.type == "unix" | in_ci()) { # windows problem
res = install_spm12(install_dir = tdir)
res = install_spm12(install_dir = tdir)
}



