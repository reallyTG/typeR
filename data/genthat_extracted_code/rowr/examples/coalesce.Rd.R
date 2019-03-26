library(rowr)


### Name: coalesce
### Title: A more versatile form of the T-SQL 'coalesce()' function.
### Aliases: coalesce

### ** Examples

coalesce(c(NA,1,2))
coalesce(c(NA,1,2),c(3,4,NA))
df<-data.frame(a=c(NA,2,3),b=c(1,2,NA))
coalesce(df$a,df$b)
# Or even just:
coalesce(df)
# Coalesce can actually use any comparison.  For example, instead of non-NA
# values it could find the max in each row:
cbind(EuStockMarkets,Max=coalesce(EuStockMarkets,fun=function (x,y) if (x>y) x else y))



