library(VGAM)


### Name: nakagami
### Title: Nakagami Distribution Family Function
### Aliases: nakagami
### Keywords: models regression

### ** Examples

nn <- 1000; shape <- exp(0); Scale <- exp(1)
ndata <- data.frame(y1 = sqrt(rgamma(nn, shape = shape, scale = Scale/shape)))
nfit <- vglm(y1 ~ 1, nakagami, data = ndata, trace = TRUE, crit = "coef")
ndata <- transform(ndata, y2 = rnaka(nn, scale = Scale, shape = shape))
nfit <- vglm(y2 ~ 1, nakagami(iscale = 3), data = ndata, trace = TRUE)
head(fitted(nfit))
with(ndata, mean(y2))
coef(nfit, matrix = TRUE)
(Cfit <- Coef(nfit))
## Not run: 
##D  sy <- with(ndata, sort(y2))
##D hist(with(ndata, y2), prob = TRUE, main = "", xlab = "y", ylim = c(0, 0.6),
##D      col = "lightblue")
##D lines(dnaka(sy, scale = Cfit["scale"], shape = Cfit["shape"]) ~ sy,
##D       data = ndata, col = "orange") 
## End(Not run)



