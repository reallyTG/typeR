library(stringi)


### Name: stri_stats_latex
### Title: Statistics for a Character Vector Containing LaTeX Commands
### Aliases: stri_stats_latex

### ** Examples

s <- c("Lorem \\textbf{ipsum} dolor sit \\textit{amet}, consectetur adipisicing elit.",
       "\\begin{small}Proin nibh augue,\\end{small} suscipit a, scelerisque sed, lacinia in, mi.",
       "")
stri_stats_latex(s)




