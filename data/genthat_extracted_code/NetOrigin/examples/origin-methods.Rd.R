library(NetOrigin)


### Name: origin-methods
### Title: methods for origin estimation objects of class 'origin'
### Aliases: origin-methods performance.origin plot.origin print.origin
###   summary.origin

### ** Examples

data(ptnGoe)
data(delayGoe)

res <- origin(events=delayGoe[10,-c(1:2)], type='centrality', graph=ptnGoe)
res

summary(res)
plot(res, start=1)
performance(res, start=1, graph=ptnGoe)




