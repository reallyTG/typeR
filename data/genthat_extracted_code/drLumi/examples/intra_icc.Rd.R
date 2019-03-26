library(drLumi)


### Name: intra_icc
### Title: Estimate ICC of a data.frame
### Aliases: intra_icc

### ** Examples

# Generate data.frame
set.seed(123)
controls <- sort(paste("Control", rep(1:3,4),sep=""))
values <-  sort(unlist(lapply(1:12, function(x)runif(1,10+x,13+x))))
plateno <- rep(c("plate1","plate2"),6)
df <- data.frame(controls,values, plateno)
df <- df[order(df$plateno),]

# Estimate ICC
intra_icc(df, id.var = c("controls","plateno"),
value.var = "values", type="agreement",model="twoway", unit="single")
intra_icc(df, id.var = c("controls","plateno"),
value.var = "values", by = "plateno", type="agreement",model="twoway",
unit="single")



