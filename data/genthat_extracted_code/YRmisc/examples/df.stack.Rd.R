library(YRmisc)


### Name: df.stack
### Title: Stack data frame by one classifier
### Aliases: df.stack

### ** Examples

df <- data.frame(matrix(nrow=100,ncol=100))
for(i in 1:100){
 df[,i] <- rep(runif(1,1,100),100)
}
dim(df)
hdf <- df.stack(df,c("date","tkr","price"))



