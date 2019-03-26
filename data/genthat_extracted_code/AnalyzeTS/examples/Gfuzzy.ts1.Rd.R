library(AnalyzeTS)


### Name: Gfuzzy.ts1
### Title: Chen, Sing, Heuristic and Chen-Hsu models at the same time
### Aliases: Gfuzzy.ts1

### ** Examples

#Step 1: Analyze fuzzy time series actual series of n fuzzy set (n is
#number fuzzy set choosed in the first times, in our case n = 5, 7 and 9)
#to has information about fuzzy sets. 
#KQ1<-Gfuzzy.ts1(lh,n=c(5,7,9),type=c("Chen","Singh","Heuristic","Chen-Hsu"))


#Step 2: Finding bin-point values divide fuzzy sets second times.
#v1<-c(1,1,1,1,1)
#v2<-c(1,2,2,1,2,1,1)
#v3<-c(1,1,2,4,1,2,1,1,1)
#KQ2<-GChenHsu.bin(KQ1,n.subset=list(v1,v2,v3))


#Step 3 Analyze fuzzy time series by Chen-Hsu more times with new fuzzy
#sets from step 2.
#KQ3<-Gfuzzy.ts1(lh,n=c(5,7,9),type=c("Chen","Singh","Heuristic",
#"Chen-Hsu"),bin=KQ2,plot=1,grid=1)
#KQ3



