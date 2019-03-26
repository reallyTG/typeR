## ---- include=FALSE------------------------------------------------------
library(knitr)
opts_chunk$set(comment=NA, prompt=FALSE, cache=FALSE, echo=TRUE, results='asis')
library(summarytools)

## ------------------------------------------------------------------------
#st_options('omit.headings', TRUE)
st_options('bootstrap.css', FALSE)
st_options('footnote', NA)

## ------------------------------------------------------------------------
freq(tobacco$gender, style = 'rmarkdown')

## ------------------------------------------------------------------------
print(freq(tobacco$gender), method = 'render')

## ------------------------------------------------------------------------
ctable(tobacco$gender, tobacco$smoker, style = 'rmarkdown')

## ----ctable_html---------------------------------------------------------
print(ctable(tobacco$gender, tobacco$smoker), method = 'render')

## ------------------------------------------------------------------------
descr(tobacco, style = 'rmarkdown')

## ------------------------------------------------------------------------
print(descr(tobacco), method = 'render', table.classes = 'st-small')

## ----dfs_grid, results='asis'--------------------------------------------
dfSummary(tobacco, style = 'grid', plain.ascii = FALSE)

## ------------------------------------------------------------------------
print(dfSummary(tobacco, graph.magnif = 0.75), method = 'render')

