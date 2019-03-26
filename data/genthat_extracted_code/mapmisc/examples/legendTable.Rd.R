library(mapmisc)


### Name: legendTable
### Title: Table for colour scales
### Aliases: legendTable

### ** Examples


mytable = data.frame(col=col2html(1:5), label=1:5)

legendTable(mytable)
legendTable(mytable, collapse=';')
legendTable(mytable, type='html')




