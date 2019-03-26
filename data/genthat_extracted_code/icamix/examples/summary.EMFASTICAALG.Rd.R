library(icamix)


### Name: summary.EMFASTICAALG
### Title: summary.EMFASTICAALG
### Aliases: summary.EMFASTICAALG

### ** Examples

## An Example that runs the NSMM-ICA algorithm on Cohen's tone data
data(tonedata, package="mixtools")

b <- EMFASTICAALG(tonedata, 2, h=0, tol=1e-8)
summary(b)



