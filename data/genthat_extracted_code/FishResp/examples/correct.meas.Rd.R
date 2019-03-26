library(FishResp)


### Name: correct.meas
### Title: Correction of Metabolic Rate Measurements
### Aliases: correct.meas

### ** Examples

# if the data have been already loaded to R,
# skip the first five lines of the code:
data(info)
data(pre)
data(post)
data(AMR.raw)
## Not run: 
##D data(SMR.raw)
##D SMR.clean <- correct.meas(info.data = info,
##D                           pre.data = pre,
##D                           meas.data = SMR.raw,
##D                           method = "pre.test")
## End(Not run)

AMR.clean <- correct.meas(info.data = info,
                          post.data = post,
                          meas.data = AMR.raw,
                          method = "post.test")




