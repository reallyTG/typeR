library(fcros)


### Name: fcrosFCmat
### Title: Calculation of a matrix of fold changes using pairwise
###   comparisons
### Aliases: fcrosFCmat

### ** Examples

   data(fdata);

   rownames(fdata) <- fdata[,1];

   cont <- c("cont01", "cont07", "cont03", "cont04", "cont08");
   test <- c("test01", "test02", "test08", "test09", "test05");
   log2.opt <- 0;

   # perform fcrosFCmat()
   fc <- fcrosFCmat(fdata, cont, test, log2.opt);

   # plot histogram of the fold change (log2 scale) in dataset
   hist(log2(fc$FC),nclass = 50);



