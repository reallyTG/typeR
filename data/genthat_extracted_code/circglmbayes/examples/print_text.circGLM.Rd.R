library(circglmbayes)


### Name: print_text.circGLM
### Title: Print the main results from a 'circGLM' object.
### Aliases: print_text.circGLM

### ** Examples

print(circGLM(th = rvmc(10, 1, 1)), type = "text")

dat <- generateCircGLMData()
cglmmod <- circGLM(th = dat[, 1], X = dat[, -1])
print(cglmmod, type = "text")



