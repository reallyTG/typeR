library(soundgen)


### Name: getFormantDispersion
### Title: Get formant dispersion
### Aliases: getFormantDispersion
### Keywords: internal

### ** Examples

nIter = 100  # nIter = 10000 for better results
speedSound = 35400
out = data.frame(vtl = runif(nIter, 5, 70),
                 nFormants = round(runif(nIter, 1, 10)),
                 noise = runif(nIter, 0, .2),
                 vtl_est = rep(NA, nIter),
                 error = rep(NA, nIter))
for (i in 1:nIter) {
  a = 1:out$nFormants[i]
  formants = sort(speedSound * (2 * a - 1) / (4 * out$vtl[i]) * rnorm(n = length(a),
                                                                 mean = 1,
                                                                 sd = out$noise[i]))
  disp = soundgen:::getFormantDispersion(formants, method = 'fast')
  out$vtl_est[i] = speedSound / 2 / disp
  out$error[i] = (out$vtl[i] -  out$vtl_est[i]) / out$vtl[i]
}
## Not run: 
##D library(ggplot2)
##D ggplot(out, aes(x = nFormants, y = error)) +
##D   geom_point(alpha = .1) +
##D   geom_smooth() +
##D   theme_bw()
##D ggplot(out, aes(x = noise, y = error)) +
##D   geom_point(alpha = .1) +
##D   geom_smooth() +
##D   theme_bw()
## End(Not run)



