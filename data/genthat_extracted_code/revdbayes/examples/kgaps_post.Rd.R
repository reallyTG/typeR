library(revdbayes)


### Name: kgaps_post
### Title: Random sampling from K-gaps posterior distribution
### Aliases: kgaps_post

### ** Examples

thresh <- quantile(newlyn, probs = 0.90)
k_postsim <- kgaps_post(newlyn, thresh)
plot(k_postsim)



