library(crp.CSFP)


### Name: init
### Title: Initializing a new entity of class crp.CSFP
### Aliases: init crp.init

### ** Examples

MyModel=init(path.in=system.file("data",package="crp.CSFP"),loss.unit=1e6,
calc.rc=TRUE)

# or pass portfolio directly and use random sector variances
Path=system.file("data",package="crp.CSFP")
portfolio=read.csv(paste(Path,"/portfolio.csv",sep=""))
rating.scale=read.csv(paste(Path,"/rating_pd.csv",sep=""))
sec.var=data.frame(Var=runif(3,0,2))

MyModel=init(portfolio=portfolio,rating.scale=rating.scale,sec.var=sec.var,
loss.unit=1e6,calc.rc=TRUE)



