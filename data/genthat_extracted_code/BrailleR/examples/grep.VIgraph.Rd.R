library(BrailleR)


### Name: grep.VIgraph
### Title: String manipulation of the output produced by VI.ggplot
### Aliases: grep grep.default grep.VIgraph gsub gsub.default gsub.VIgraph

### ** Examples

if (require(ggplot2)) {
    grep("axis", VI(qplot(1,1)))
    gsub("labels", "tick labels", VI(qplot(1,1)))
}



