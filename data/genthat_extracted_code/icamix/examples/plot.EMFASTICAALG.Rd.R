library(icamix)


### Name: plot.EMFASTICAALG
### Title: plot.EMFASTICAALG
### Aliases: plot.EMFASTICAALG
### Keywords: ~kwd1 ~kwd2

### ** Examples

## An Example that runs the NSMM-ICA algorithm on Cohen's tone data
data(tonedata, package="mixtools")

b <- EMFASTICAALG(tonedata, 2, h=0, tol=1e-8)
plot(b)



