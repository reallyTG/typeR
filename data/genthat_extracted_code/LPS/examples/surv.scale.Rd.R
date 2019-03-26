library(LPS)


### Name: surv.scale
### Title: Plots a survival color scale, for legend
### Aliases: surv.scale

### ** Examples

  # Rosenwald's dataset (hand-picked prognostic probes)
  data(rosenwald)
  probes <- c("30580", "16006", "32315", "16978", "26588")
  expr <- t(rosenwald.expr[ probes ,])
  
  # NA imputation (feature's mean to minimize impact)
  f <- function(x) { x[ is.na(x) ] <- round(mean(x, na.rm=TRUE), 3); x }
  expr <- apply(expr, 2, f)
  
  # Survival colors
  surv <- with(rosenwald.cli, surv.colors(time=follow.up, event=status=="Dead"))
  
  # Annotated clustering
  side <- data.frame(OS=surv, row.names=rownames(rosenwald.cli))
  clusterize(expr, side=side)
  
  # Color scale legend
  with(rosenwald.cli, surv.scale(time=follow.up, event=status=="Dead"))



