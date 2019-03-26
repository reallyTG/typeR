library(inlmisc)


### Name: PrintTable
### Title: Print as LaTeX Table
### Aliases: PrintTable
### Keywords: print

### ** Examples

d <- datasets::iris[, c(5, 1:4)]
colheadings <- rbind(c("Species \\\\ type", rep("Sepal", 2), rep("Petal", 2)),
                     c("", rep(c("Length", "Width"), 2)))
align <- c("l", "c", "c", "c", "c")
digits <- c(0, 1, 1, 1, 1)
title <- "Measurements of sepal length and width and petal length and width
          for three species of Iris flower."
headnotes <- "\\textbf{Species of Iris}: includes setosa, versicolor, and virginica.
              \\textbf{Abbreviations}: cm, centimeters"
levels(d[[1]]) <- sprintf("%s\\footnotemark[%d]", levels(d[[1]]), 1:3)
footnotes <- paste(sprintf("\\footnotemark[%d] Common name is %s iris.", 1:3,
                           c("Wild Flag", "Blue Flag", "Virginia")), collapse = "\\\\")
hline <- utils::tail(which(!duplicated(d[[1]])), -1) - 1L
PrintTable(d, colheadings, align, digits, title = title, headnotes = headnotes,
           footnotes = footnotes, hline = hline, nrec = c(41, 42), rm_dup = 1)

## Not run: 
##D sink("table-example.tex")
##D cat("\\documentclass{article}",
##D     "\\usepackage[labelsep = period, labelfont = bf]{caption}",
##D     "\\usepackage{siunitx}",
##D     "\\sisetup{input-ignore = {,}, input-decimal-markers = {.},",
##D     "          group-separator = {,}, group-minimum-digits = 4}",
##D     "\\usepackage{booktabs}",
##D     "\\usepackage{makecell}",
##D     "\\usepackage{multirow}",
##D     "\\usepackage[pdftex]{lscape}",
##D     "\\makeatletter",
##D     "\\setlength{\\@fptop}{0pt}",
##D     "\\makeatother",
##D     "\\begin{document}", sep = "\n")
##D 
##D PrintTable(d, colheadings, align, digits, title = title, headnotes = headnotes,
##D            footnotes = footnotes, hline = hline, nrec = c(41, 42), rm_dup = 1)
##D 
##D cat("\\clearpage\n")
##D PrintTable(datasets::CO2[, c(2, 3, 1, 4, 5)], digits = c(0, 0, 0, 0, 1),
##D            title = "Carbon dioxide uptake in grass plants.", nrec = 45, rm_dup = 3)
##D 
##D cat("\\clearpage\n")
##D digits <- c(1, 0, 1, 0, 2, 3, 2, 0, 0, 0, 0)
##D PrintTable(datasets::mtcars, digits = digits, title = "Motor trend car road tests.",
##D            landscape = TRUE, include.rownames = TRUE)
##D 
##D cat("\\clearpage\n")
##D d <- data.frame(matrix(rep(c(1.2, 1.23, 1121.2, 184, NA, pi, 0.4), 4), ncol = 4))
##D d[, 1] <- prettyNum(d[, 1])
##D d[, 4] <- formatC(d[, 4], digits = 2, format = "e")
##D colheadings <- paste("Wide heading", 1:ncol(d))
##D align <- c("S", "S", "S[round-mode = places, round-precision = 2]",
##D            "S[scientific-notation = true, table-format = 1.2e+1]")
##D PrintTable(d, colheadings, align)
##D 
##D cat("\\end{document}\n")
##D sink()
##D tools::texi2pdf("table-example.tex", clean = TRUE)  # requires TeX installation
##D system("open table-example.pdf")
##D 
##D file.remove("table-example.tex", "table-example.pdf")
## End(Not run)




