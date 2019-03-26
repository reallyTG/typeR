library(GAIPE)


### Name: GAIPE.RMSEA
### Title: Sample size planning by GAIPE framework on RMSEA
### Aliases: GAIPE.RMSEA

### ** Examples

# Drawing the graphs in  Lin & Weng (Under review) #

# FIGURE 2 #
GAIPE.RMSEA(rmsea=.05,df=30,width=c(.03,.04))

# FIGURE 3 #
GAIPE.RMSEA(rmsea=c(.05,.08),df=30,width=c(.03,.04))

# FIGURE 4 #
GAIPE.RMSEA(rmsea=.025,df=30,width=c(.03,.04),PA_method="not.close.fit",H0rmsea=0.05)

# FIGURE 5 #
GAIPE.RMSEA(rmsea=.05,df=30,width=c(.03,.04),PA_method="exact.fit",H0rmsea=0) 




