library(fcros)


### Name: fcrosTtest
### Title: Student t-test for detecting differentially expressed genes
### Aliases: fcrosTtest

### ** Examples

   data(fdata);

   rownames(fdata) <- fdata[,1];

   cont <- c("cont01", "cont07", "cont03", "cont04", "cont08");
   test <- c("test01", "test02", "test08", "test09", "test05");
   log2.opt <- 0;

   # perform fcrosTtest()
   at <- fcrosTtest(fdata, cont, test, log2.opt);
   
   # now select some differentially expressed genes
   id.de  <- matrix(0, 1);
   n <- length(at$FC);
   for (i in 1:n) {
       if ((at$p.value)[i] <= 0.0005) { id.de <- rbind(id.de, i); }
   }

   data.de <- fdata[id.de, ];
   nde <- nrow(data.de);

   # now plot the DE genes
   t <- 1:20;
   plot(t, data.de[1, 2:21], type = "l", col = "blue", xlim = c(1,20),
        ylim = c(0,18), main = "Down- and up-regulated genes");
   for (i in 2:nde) {
       lines(t, data.de[i,2:21], type = "l", col = "blue")
   }



