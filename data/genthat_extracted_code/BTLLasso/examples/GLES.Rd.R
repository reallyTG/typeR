library(BTLLasso)


### Name: GLES
### Title: German Longitudinal Election Study (GLES)
### Aliases: GLES
### Keywords: datasets

### ** Examples

## Not run: 
##D op <- par(no.readonly = TRUE)
##D 
##D data(GLES)
##D Y <- GLES$Y
##D X <- scale(GLES$X, scale = FALSE)
##D 
##D subs <- c("(in years)","female (1); male (0)","East Germany (1); West Germany (0)",
##D           "(very) good (1); else (0)", "Abitur/A levels (1); else (0)", 
##D           "currently unemployed (1); else (0)","at least once a month (1); else (0)",
##D           "yes (1); no (0)")
##D 
##D set.seed(5)
##D m.gles <- cv.BTLLasso(Y = Y, X = X, control = ctrl.BTLLasso(l.lambda = 50))
##D 
##D par(xpd = TRUE, mar = c(5,4,4,6))
##D plot(m.gles, subs.X = subs)
##D 
##D par(op)
## End(Not run)




