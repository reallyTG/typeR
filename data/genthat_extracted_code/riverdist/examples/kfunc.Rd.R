library(riverdist)


### Name: kfunc
### Title: Plotting K-functions for a Set of Surveys
### Aliases: kfunc

### ** Examples

data(Gulk, fakefish)

# # 10 plots will be created - recommend calling
# # par(mfrow=c(3,4))

kfunc(seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, survey=fakefish$flight,
envreps=100, maxdist=200000)

# # This shows relatively high amounts of clustering for surveys 1 and 8,
# # and relatively high amounts of dispersal in surveys 5 and 6.


# # plotting the survey locations that led to this calculation, for comparison

# # 10 plots will be created - recommend calling
# # par(mfrow=c(3,4))
for(i in 1:10) {
  plot(x=Gulk, segmentnum=FALSE, color=FALSE, main=i)
  riverpoints(seg=fakefish$seg[fakefish$flight==i], 
  vert=fakefish$vert[fakefish$flight==i], rivers=Gulk, col=2, pch=15)
}



