library(fcros)


### Name: histoPlot
### Title: Histogram plot function of the fcros package results
### Aliases: histoPlot

### ** Examples

   data(fdata);
   rownames(fdata) <- fdata[,1];

   cont <- c("cont01", "cont07", "cont03", "cont04", "cont08");
   test <- c("test01", "test02", "test08", "test09", "test05");
   log2.opt <- 0;

   # perform fcros() and pfco()
   af <- fcros(fdata, cont, test, log2.opt);
   af2 <- pfco(fdata, cont, test, log2.opt);

   # Histogram plots
   op <- par(mfrow = c(1,2))
      histoPlot(af);
      histoPlot(af2);
   par(op);



