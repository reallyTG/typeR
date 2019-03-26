library(R330)


### Name: vapour.df
### Title: Hydrocarbon data
### Aliases: vapour.df
### Keywords: datasets

### ** Examples

data(vapour.df)
vapour.lm<-lm(hc~ t.temp + p.temp + t.vp + p.vp, data=vapour.df)
summary(vapour.lm)




