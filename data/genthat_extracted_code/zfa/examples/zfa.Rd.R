library(zfa)


### Name: zfa
### Title: Zoom-Focus Algorithm
### Aliases: zfa

### ** Examples

data(zfa.example)
attach(zfa.example)

# fast-zoom with wtest, all zoomed regions passed to focusing step, and output all results
zfa.result1<-zfa(X,y,bin = 32,fast.path = TRUE,filter.pval=NULL,output.pval=NULL,test = "wtest")

# zooming with wtest, select zoomed regions for focusing and output regions with both p-value<0.01
zfa.result2<-zfa(X,y,bin = 32,fast.path = FALSE,filter.pval=0.01,output.pval=0.01,test = "wtest")

## an example to view the detail of variants in each output optimal region
result1.detail<-zfa.result1$variants




