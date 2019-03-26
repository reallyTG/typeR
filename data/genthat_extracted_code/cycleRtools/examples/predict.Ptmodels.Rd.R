library(cycleRtools)


### Name: predict.Ptmodels
### Title: Predict Power or Time
### Aliases: predict.Ptmodels

### ** Examples

data(Pt_prof)  # Example power-time profile.

P    <- Pt_prof$pwr
tsec <- Pt_prof$time

mdls <- Pt_model(P, tsec)  ## Model.
print(mdls)

## What is the best predicted 20 minute power?
predict(mdls, x = 60 * 20, xtype = "time")

## How sustainable is 500 Watts?
predict(mdls, x = 500, xtype = "P") / 60  # Minutes.

## Create some plots of the models.
par(mfrow = c(2, 2), mar = c(3.1, 3.1, 1.1, 1.1))
plotargs <- alist(x = tsec, y = P, cex = 0.2, ann = FALSE, bty = "l")
mapply(function(f, m) {
  do.call(plot, plotargs)
  curve(f(x), col = "red", add = TRUE)
  title(main = paste0(rownames(m),"; RSE = ", round(m$RSE, 2)))
  legend("topleft", legend = m$formula, bty = "n")
  return()
}, f = mdls$Pfn, m = split(mdls$table, seq_len(nrow(mdls$table))))




