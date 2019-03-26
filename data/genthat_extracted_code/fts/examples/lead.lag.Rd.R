library(fts)


### Name: lead.lag
### Title: Shift an Fts ojbect in time
### Aliases: lead.lag.fts lead lag.fts lead.fts
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=10),data=1:10)
print(x)
lag(x,1)
lead(x,1)



