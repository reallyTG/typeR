library(rasciidoc)


### Name: rasciidoc
### Title: Render an 'asciidoc' File
### Aliases: rasciidoc

### ** Examples

wd <- file.path(tempdir(), "rasciidoc")
dir.create(wd)
file  <- system.file("files", "minimal", "knit.asciidoc",
                     package = "rasciidoc")
file.copy(file, wd)
rasciidoc::rasciidoc(file.path(wd, basename(file)), "-b docbook")
if (isTRUE(getOption("write_to_disk"))) {
    dir(wd, full.names = TRUE)
} else {
    dir(tempdir(), full.names = TRUE)
}
unlink(wd, recursive = TRUE)



