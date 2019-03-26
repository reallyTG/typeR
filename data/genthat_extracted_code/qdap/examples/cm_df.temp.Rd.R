library(qdap)


### Name: cm_df.temp
### Title: Break Transcript Dialogue into Blank Code Matrix
### Aliases: cm_df.temp
### Keywords: coding

### ** Examples

## Not run: 
##D codes <- qcv(dc, sf, wes, pol, rejk, lk, azx, mmm)
##D out1 <- cm_df.temp(DATA, "state", codes)
##D head(out1, 15)
##D out2 <- cm_df.temp(DATA, "state", codes, transpose = TRUE)
##D out2[, 1:10]
##D out3 <- cm_df.temp(raj.act.1, "dialogue", codes)
##D head(out3, 15)
##D out4 <- cm_df.temp(raj.act.1, "dialogue", codes, transpose = TRUE)
##D out4 [, 1:8]
## End(Not run)



