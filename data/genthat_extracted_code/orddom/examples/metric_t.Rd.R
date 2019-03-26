library(orddom)


### Name: metric_t
### Title: Metric t-test parameters matrix
### Aliases: metric_t

### ** Examples
## Not run: 
##D > #Example from Dunlap et al. (1996), Table 1
##D > y<-c(27,25,30,29,30,33,31,35)
##D > x<-c(21,25,23,26,27,26,29,31)
##D > metric_t(x,y)
##D                  [,1]
##D Diff M     4.00000000
##D t value    2.52982213
##D df Welch  14.00000000
##D p value    0.02403926
##D Cohen's d  1.26491106
##D > metric_t(x,y,paired=TRUE)
##D                  [,1]
##D Diff M    4.000000000
##D t(dep.)   4.512608599
##D df        7.000000000
##D p value   0.002756406
##D Cohen's d 1.264911064
## End(Not run)


