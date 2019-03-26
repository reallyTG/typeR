library(fcros)


### Name: fvalTopN
### Title: Search for the top N changed genes or probes using f-values
### Aliases: fvalTopN

### ** Examples

   data(fdata);
   rownames(fdata) <- fdata[,1];

   cont <- c("cont01", "cont07", "cont03", "cont04", "cont08");
   test <- c("test01", "test02", "test08", "test09", "test05");
   log2.opt <- 0;

   # perform pfco()
   af <- pfco(fdata, cont, test, log2.opt);
   
   # now select top 10 down and/or up regulated genes
   top10 <- fvalTopN(af$f.value, 10);

   # display thresholds
   top10$alpha
   
   # display index of top10 genes
   fdata[top10$index, 1]
   
   # display fvalue of the top10 genes
   (af$f.value)[top10$index]



