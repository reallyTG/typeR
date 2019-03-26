library(profr)


### Name: profr
### Title: Profile the performance of a function call.
### Aliases: profr
### Keywords: debugging

### ** Examples

## Not run: 
##D glm_ex <- profr({Sys.sleep(1); example(glm)}, 0.01)
##D head(glm_ex)
##D summary(glm_ex)
##D plot(glm_ex)
## End(Not run)



