library(RMark)


### Name: MStruncate
### Title: Truncate capture histories for multi-state models
### Aliases: MStruncate

### ** Examples

## No test: 
data(mstrata)
df=MStruncate(mstrata,k=2)
dp=process.data(df,model="Multistrata",groups=c("release"),begin.time=1:max(as.numeric(df$release)))
ddl=make.design.data(dp)
table(ddl$S$release,ddl$S$time)
table(ddl$p$release,ddl$p$time)
## End(No test)




