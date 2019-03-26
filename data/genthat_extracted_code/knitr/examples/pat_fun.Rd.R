library(knitr)


### Name: pat_rnw
### Title: Set regular expressions to read input documents
### Aliases: pat_rnw pat_brew pat_tex pat_html pat_md pat_rst pat_asciidoc
###   pat_textile

### ** Examples

# see how knit_patterns is modified
knit_patterns$get()
pat_rnw()
knit_patterns$get()

knit_patterns$restore()  # empty the list



