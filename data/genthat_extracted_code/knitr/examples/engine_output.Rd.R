library(knitr)


### Name: engine_output
### Title: An output wrapper for language engine output
### Aliases: engine_output

### ** Examples

library(knitr)
engine_output(opts_chunk$merge(list(engine = "Rscript")), 
    code = "1 + 1", out = "[1] 2")
engine_output(opts_chunk$merge(list(echo = FALSE, engine = "Rscript")), 
    code = "1 + 1", out = "[1] 2")

# expert use only
engine_output(opts_chunk$merge(list(engine = "python")), 
    out = list(structure(list(src = "1 + 1"), class = "source"), 
        "2"))



