library(circglmbayes)


### Name: print_all.circGLM
### Title: Print all results from a circGLM object
### Aliases: print_all.circGLM

### ** Examples

print(circGLM(th = rvmc(10, 1, 1)), type = "all")

dat <- generateCircGLMData()
cglmmod <- circGLM(th ~ ., dat)
print(cglmmod, type = "all")



