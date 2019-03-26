library(HCR)


### Name: simuXY
### Title: Simulate the data of hidden compact representation model.
### Aliases: simuXY

### ** Examples

df=simuXY(sample_size=100,type=0)
length(unique(df[,1]))
length(unique(df[,2]))
length(unique(df[,3]))

df=simuXY(sample_size=100,type=1)
length(unique(df[,1]))
length(unique(df[,3]))

df=simuXY(sample_size=100,type=2)
length(unique(df[,2]))
length(unique(df[,3]))

df=simuXY(sample_size=100,type=3)
length(unique(df[,1]))
length(unique(df[,2]))

df=simuXY(sample_size=100,type=4)
length(unique(df[,1]))
length(unique(df[,2]))
length(unique(df[,3]))




