library(rasciidoc)


### Name: render
### Title: Spin or Knit and Render a 'Rasciidoc' File
### Aliases: render

### ** Examples

wd <- file.path(tempdir(), "rasciidoc")
dir.create(wd)
file  <- system.file("files", "minimal", "knit.Rasciidoc",
                     package = "rasciidoc")
file.copy(file, wd)
rasciidoc::render(file.path(wd, basename(file)), asciidoc_args = "-b slidy")
if (isTRUE(getOption("write_to_disk"))) {
    dir(wd, full.names = TRUE)
} else {
    dir(tempdir(), full.names = TRUE)
}
unlink(wd, recursive = TRUE)



