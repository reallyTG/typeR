library(errint)


### Name: df_intervals
### Title: Data Frames of Intervals
### Aliases: as.df_intervals df_intervals is.df_intervals

### ** Examples

df_intervals("l",0.1)

df_intervals(c("l","lm","n","nm","b","w"),rep(0.1,6))


df<-data.frame(distribution=rnorm(10),error=rnorm(10))
as.df_intervals(df)

v<-c("a","b")
as.df_intervals(v)


df<-data.frame(distribution=rnorm(10),error=rnorm(10))
is.df_intervals(df)
res<-as.df_intervals(df)
is.df_intervals(res)



