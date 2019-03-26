library(epanetReader)


### Name: plotSparklineTable
### Title: Plot Sparkline Table
### Aliases: plotSparklineTable

### ** Examples

plotSparklineTable( Orange, row.var = 'Tree', col.vars = c('age','circumference'))
plotSparklineTable( Loblolly, row.var = 'Seed', col.vars = 'height')
## specify the x variable if you have it, especially if it differs 
plotSparklineTable(Theoph, row.var = 'Subject', col.vars = 'conc')
## a warning is normally issued with the ranges of xvar differ 
suppressWarnings( plotSparklineTable(Theoph, row.var = 'Subject', col.vars = 'conc', xvar = 'Time'))



