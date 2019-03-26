library(epanetReader)


### Name: sparkline
### Title: Sparkline
### Aliases: sparkline

### ** Examples

## look at the names in the built-in data set Theoph
names(Theoph) 
## make sparkline object for the concentration over time in subject 2
sl <- sparkline(df= Theoph, id.var = 'Subject', ID = 2, yvar='conc', xvar = 'Time') 
plot(sl)



