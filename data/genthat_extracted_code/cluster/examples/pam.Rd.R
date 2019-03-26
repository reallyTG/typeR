library(cluster)


### Name: pam
### Title: Partitioning Around Medoids
### Aliases: pam
### Keywords: cluster

### ** Examples

## generate 25 objects, divided into 2 clusters.
x <- rbind(cbind(rnorm(10,0,0.5), rnorm(10,0,0.5)),
           cbind(rnorm(15,5,0.5), rnorm(15,5,0.5)))
pamx <- pam(x, 2)
pamx # Medoids: '7' and '25' ...
summary(pamx)
plot(pamx)
## use obs. 1 & 16 as starting medoids -- same result (typically)
(p2m <- pam(x, 2, medoids = c(1,16)))
## no _build_ *and* no _swap_ phase: just cluster all obs. around (1, 16):
p2.s <- pam(x, 2, medoids = c(1,16), do.swap = FALSE)
p2.s

p3m <- pam(x, 3, trace = 2)
## rather stupid initial medoids:
(p3m. <- pam(x, 3, medoids = 3:1, trace = 1))

## Don't show: 
 ii <- pmatch(c("obj","call"), names(pamx))
 stopifnot(all.equal(pamx [-ii],  p2m [-ii],  tolerance=1e-14),
           all.equal(pamx$objective[2], p2m$objective[2], tolerance=1e-14))
## End(Don't show)
pam(daisy(x, metric = "manhattan"), 2, diss = TRUE)

data(ruspini)
## Plot similar to Figure 4 in Stryuf et al (1996)
## Not run: plot(pam(ruspini, 4), ask = TRUE)
## Don't show: 
plot(pam(ruspini, 4))
## End(Don't show)



