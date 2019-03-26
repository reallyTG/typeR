library(exams)


### Name: include_tikz
### Title: Including Figures from TikZ Code in Exercises
### Aliases: include_tikz
### Keywords: utilities

### ** Examples

## TikZ code for a logic gate
tz <- "
  \\node[left,draw, logic gate inputs=nn, xor gate US,fill=white,,scale=2.5] (G1) at (0,0) {};
  \\draw (G1.output) --++ (0.5,0) node[right] (y) {$y$};
  \\draw (G1.input 1) --++ (-0.5,0) node[left] {$a$};
  \\draw (G1.input 2) --++ (-0.5,0) node[left] {$b$};
"

## switch to temporary directory
wd <- getwd()
td <- tempfile()
dir.create(td)
setwd(td)
dir()

## produce PDF figure and produce includegraphics statement
include_tikz(tz, name = "logicgate", format = "pdf",
  library = c("arrows", "shapes.gates.logic.US", "calc"),
  width = "2.5cm")
dir()

## alternatively produce just the complete TikZ code
include_tikz(tz, name = "logicgate", format = "tex",
  library = c("arrows", "shapes.gates.logic.US", "calc"))

## switch back to original working directory
setwd(wd)



