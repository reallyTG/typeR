library(PeakSegOptimal)


### Name: PeakSegFPOP
### Title: PeakSegFPOP
### Aliases: PeakSegFPOP

### ** Examples


## Use the algo to compute the solution list.
library(PeakSegOptimal)
data("H3K4me3_XJ_immune_chunk1", envir=environment())
by.sample <-
  split(H3K4me3_XJ_immune_chunk1, H3K4me3_XJ_immune_chunk1$sample.id)
n.data.vec <- sapply(by.sample, nrow)
one <- by.sample[[1]]
count.vec <- one$coverage
weight.vec <- with(one, chromEnd-chromStart)
penalty <- 1000
fit <- PeakSegFPOP(count.vec, weight.vec, penalty)

## Recover the solution in terms of (M,C) variables.
change.vec <- with(fit, rev(ends.vec[ends.vec>0]))
change.sign.vec <- rep(c(1, -1), length(change.vec)/2)
end.vec <- c(change.vec, fit$n.data)
start.vec <- c(1, change.vec+1)
length.vec <- end.vec-start.vec+1
mean.vec <- rev(fit$mean.vec[1:(length(change.vec)+1)])
M.vec <- rep(mean.vec, length.vec)
C.vec <- rep(0, fit$n.data-1)
C.vec[change.vec] <- change.sign.vec
diff.vec <- diff(M.vec)
data.frame(
  change=c(C.vec, NA),
  mean=M.vec,
  equality.constraint.active=c(sign(diff.vec) != C.vec, NA))
stopifnot(cumsum(sign(C.vec)) %in% c(0, 1))

## Compute penalized Poisson loss of M.vec and compare to the value reported
## in the fit solution list.
n.peaks <- sum(C.vec==1)
rbind(
  n.peaks*penalty + PoissonLoss(count.vec, M.vec, weight.vec),
  fit$cost.mat[2, fit$n.data])

## Plot the number of intervals stored by the algorithm.
FPOP.intervals <- data.frame(
  label=ifelse(as.numeric(row(fit$intervals.mat))==1, "up", "down"),
  data=as.numeric(col(fit$intervals.mat)),
  intervals=as.numeric(fit$intervals.mat))
library(ggplot2)
ggplot()+
  theme_bw()+
  theme(panel.margin=grid::unit(0, "lines"))+
  facet_grid(label ~ .)+
  geom_line(aes(data, intervals), data=FPOP.intervals)+
  scale_y_continuous(
    "intervals stored by the\nconstrained optimal segmentation algorithm")




