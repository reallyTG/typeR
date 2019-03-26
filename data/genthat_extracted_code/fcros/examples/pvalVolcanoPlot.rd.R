library(fcros)


### Name: pvalVolcanoPlot
### Title: Performs a volcano plot of the FCROS/PFCO statistics
### Aliases: pvalVolcanoPlot

### ** Examples

   data(fdata);

   rownames(fdata) <- fdata[,1]
   cont <- c("cont01", "cont07", "cont03", "cont04", "cont08");
   test <- c("test01", "test02", "test08", "test09", "test05");
   log2.opt <- 0;

   # perform fcros()
   af <- fcros(fdata, cont, test, log2.opt);
   
   # Volcano plot
   pvalVolcanoPlot(af, thr = 1e-6);



