library(qdap)


### Name: cm_df2long
### Title: Transform Codes to Start-End Durations
### Aliases: cm_df2long
### Keywords: coding, span time

### ** Examples

## Not run: 
##D codes <- qcv(dc, sf, wes, pol, rejk, lk, azx, mmm)
##D x1 <- cm_df.temp(DATA, "state", codes)
##D head(x1)
##D 
##D #empty code matrix
##D out1 <- cm_df2long(x1,  code.vars = codes)
##D head(out1, 15)
##D 
##D #fill it randomly
##D x1[, 7:14] <- lapply(7:14,  function(i) sample(0:1, nrow(x1), TRUE))
##D out2 <- cm_df2long(x1,  code.vars = codes)
##D head(out2, 15)
##D plot(out2)
## End(Not run)



