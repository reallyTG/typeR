library(hapassoc)


### Name: summary.hapassoc
### Title: Summarize results of the hapassoc function
### Aliases: summary.hapassoc
### Keywords: methods

### ** Examples

data(hypoDat)
example.pre.hapassoc<-pre.hapassoc(hypoDat, 3)
example.regr <- hapassoc(affected ~ attr + h000+ h010 + h011 + h100 + pooled,
                     example.pre.hapassoc, family=binomial())

# Summarize the results:
summary(example.regr)

# Results:
#$coefficients
#               Estimate Std. Error      zscore   Pr(>|z|)
#(Intercept) -1.24114270  0.7820977 -1.58694079 0.11252606
#attr         0.74036920  0.2918205  2.53707057 0.01117844
#h000         1.14968352  0.5942542  1.93466627 0.05303126
#h010        -0.59318434  0.6569672 -0.90291311 0.36657201
#h011        -0.03615243  0.9161959 -0.03945928 0.96852422
#h100        -0.85329292  1.0203105 -0.83630709 0.40298217
#pooled       0.38516864  0.8784283  0.43847478 0.66104215
#
#$frequencies
#         Estimate Std. Error
#f.h000 0.26716394 0.03933158
#f.h001 0.25191674 0.03866739
#f.h010 0.21997138 0.03881578
#f.h011 0.10094795 0.02949617
#f.h100 0.09507014 0.02371878
#f.h101 0.02584918 0.01411881
#f.h110 0.01779455 0.01386080
#f.h111 0.02128613 0.01247265
#
#$dispersion
#[1] 1



