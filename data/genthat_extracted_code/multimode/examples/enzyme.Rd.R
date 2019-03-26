library(multimode)


### Name: enzyme
### Title: Blood enzymatic activity
### Aliases: enzyme
### Keywords: datasets

### ** Examples

data("enzyme")
# It can be seen that there are two groups in this dataset
# Via exploratory tools
sizer(enzyme,bws=c(0.03,1))
modetree(enzyme,bws=c(0.02,1),logbw=TRUE,addplot=TRUE,col.lines="white")
#Via mode testing
modetest(enzyme)
## Not run: 
##D modetest(enzyme,mod0=2)
## End(Not run)



