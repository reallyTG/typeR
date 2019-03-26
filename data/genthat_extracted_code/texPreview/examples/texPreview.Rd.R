library(texPreview)


### Name: texPreview
### Title: Render and Preview snippets of TeX in R Viewer
### Aliases: texPreview

### ** Examples

data('iris')
if(interactive()){

#use xtable to create tex output
 texPreview(obj = xtable::xtable(head(iris,10)))

#use knitr kable to create tex output
 texPreview(knitr::kable(mtcars, "latex"))

tex='\\begin{tabular}{llr}
\\hline
\\multicolumn{2}{c}{Item} \\\\
\\cline{1-2}
Animal    & Description & Price (\\$) \\\\
\\hline
Gnat      & per gram    & 13.65      \\\\
& each        & 0.01       \\\\
Gnu       & stuffed     & 92.50      \\\\
Emu       & stuffed     & 33.33      \\\\
Armadillo & frozen      & 8.99       \\\\
\\hline
\\end{tabular}'

texPreview(obj = tex,stem = 'eq',imgFormat = 'svg')
tikz_example <- system.file('examples/tikz/credit-rationing.tex',package = 'texPreview')
tikzEx=readLines(tikz_example,warn = FALSE)

#use tex_lines parameter to pass full document
  texPreview(tex_lines = tikzEx)

#use texPreview preamble to build document chunks
  usetikz=paste(tikzEx[14:23],collapse="\n")
  bodytikz=paste(tikzEx[25:90],collapse="\n")
  texPreview(obj = bodytikz,usrPackages = build_usepackage(pkg = 'tikz',uselibrary = usetikz))
}




