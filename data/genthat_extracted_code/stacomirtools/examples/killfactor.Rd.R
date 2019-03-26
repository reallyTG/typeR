library(stacomirtools)


### Name: killfactor
### Title: very usefull function remove factor that appear, noticeably
###   after loading with 'ODBC'
### Aliases: killfactor

### ** Examples

df <- data.frame("var1" = c("blue","red"),"var2"=c("nice","ugly"))
df[,"var1"] <- as.factor(df[,"var1"])
df[,"var2"] <- as.factor(df[,"var2"])
df <- killfactor(df)
apply(df,1,function(x) is.factor(x)) # FALSE FALSE



