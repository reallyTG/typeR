library(semTools)


### Name: net
### Title: Nesting and Equivalence Testing
### Aliases: net

### ** Examples


## Not run: 
##D m1 <- ' visual  =~ x1 + x2 + x3
##D 	       textual =~ x4 + x5 + x6
##D 	       speed   =~ x7 + x8 + x9 '
##D 
##D 
##D m2 <- ' f1  =~ x1 + x2 + x3 + x4
##D 	       f2 =~ x5 + x6 + x7 + x8 + x9 '
##D 
##D m3 <- ' visual  =~ x1 + x2 + x3
##D 	       textual =~ eq*x4 + eq*x5 + eq*x6
##D 	       speed   =~ x7 + x8 + x9 '
##D 
##D fit1 <- cfa(m1, data = HolzingerSwineford1939)
##D fit1a <- cfa(m1, data = HolzingerSwineford1939, std.lv = TRUE) # Equivalent to fit1
##D fit2 <- cfa(m2, data = HolzingerSwineford1939) # Not equivalent to or nested in fit1
##D fit3 <- cfa(m3, data = HolzingerSwineford1939) # Nested in fit1 and fit1a
##D 
##D tests <- net(fit1, fit1a, fit2, fit3)
##D tests
##D summary(tests)
## End(Not run)




