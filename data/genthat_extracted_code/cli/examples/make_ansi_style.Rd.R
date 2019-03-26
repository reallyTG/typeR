library(cli)


### Name: make_ansi_style
### Title: Create a new ANSI style
### Aliases: make_ansi_style

### ** Examples

make_ansi_style("orange")
make_ansi_style("#123456")
make_ansi_style("orange", bg = TRUE)

orange <- make_ansi_style("orange")
orange("foobar")
cat(orange("foobar"))



