library(NRejections)


### Name: resample_resid
### Title: Resample residuals for OLS
### Aliases: resample_resid

### ** Examples

samp.res = dataset_result( X = "complaints",
                C = c("privileges", "learning"),
                Ys = c("rating", "raises"),
                d = attitude,
                center.stats = FALSE,
                bhat.orig = NA,  # bhat.orig is a single value now for just the correct Y
                alpha = 0.05 )

resamps = resample_resid(  X = "complaints",
                  C = c("privileges", "learning"),
                  Ys = c("rating", "raises"),
                  d = attitude,
                  alpha = 0.05,
                  resid = samp.res$resid,
                  bhat.orig = samp.res$b,
                  B=20,
                  cores = 2)



