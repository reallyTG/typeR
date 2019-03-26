library(fcros)


### Name: rankReads
### Title: This function computes a score to assess the significance of
###   sequencing values
### Aliases: rankReads

### ** Examples

   data(bott);
   cont <- c("SRX033480", "SRX033488", "SRX033481");
   test <- c("SRX033493", "SRX033486", "SRX033494");
   n <- nrow(bott);

   x2 <- tcnReads(bott[,c(cont,test)])
   idx.ok <- (apply(x2, 1, sum) != 0)
   xdata <- x2[,c(cont,test)]
   rownames(xdata) <- bott[,1]
   idx.ok <- (apply(x2, 1, sum) != 0)
   tt2 <- sum(idx.ok)

   raf10.cv <- rankReads(xdata, cont, test, meth=0)
   raf10.pv <- rankReads(xdata, cont, test, meth=1)
   score.cv <- -log10(sort(raf10.cv$score))
   score.pv <- -log10(sort(raf10.pv$score))
   tmp <- scoreThr(score.cv, 2500, 3500)
   tmp

   tmp <- scoreThr(score.pv, 2500, 3500)
   tmp

   op <- par(mfrow = c(1,2))
   plot(score.cv, xlab = "index of genes",
      ylab = "-log10(sorted(score)", main = "rs.cv", type = "l",
      col = "blue", panel.first = grid())
   plot(score.pv, xlab = "index of genes",
      ylab = "-log10(sorted(score)", main = "rs.pv", type = "l",
      col = "blue", panel.first = grid())
   par(op)



