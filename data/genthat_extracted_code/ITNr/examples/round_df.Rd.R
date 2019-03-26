library(ITNr)


### Name: round_df
### Title: round_df
### Aliases: round_df

### ** Examples

##Create dataframe
ID = c("a","b","c","d","e")
Value1 = c(3.445662,6.44566,8.75551,1.114522,1.5551)
Value2 = c(8.2,1.7,6.4,19.45459,10.34524)
df<-data.frame(ID,Value1,Value2)

##Round to 2 digits
rounddf<-round_df(df,2)



