library(ashr)


### Name: get_post_sample
### Title: Sample from posterior
### Aliases: get_post_sample

### ** Examples

beta = rnorm(100,0,1)
betahat= beta+rnorm(100,0,1)
ash.beta = ash(betahat,1,mixcompdist="normal")
post.beta = get_post_sample(ash.beta,1000)



