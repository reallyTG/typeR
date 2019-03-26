library(pgam)


### Name: tbl2tex
### Title: LaTeX table exporter
### Aliases: tbl2tex
### Keywords: ts smooth regression

### ** Examples

library(pgam)
data(aihrio)
m <- aihrio[1:10,4:10]
tbl2tex(m,label="tbl:r_example",caption="R example of tbl2tex",digits=4)



