library(fcros)


### Name: fcros-package
### Title: A Method to Search for Differentially Expressed Genes and to
###   Detect Recurrent Chromosomal Copy Number Aberrations
### Aliases: fcros-package
### Keywords: package

### ** Examples

   data(fdata);

   rownames(fdata) <- fdata[,1];

   cont <- c("cont01", "cont07", "cont03", "cont04", "cont08");
   test <- c("test01", "test02", "test08", "test09", "test05");
   log2.opt <- 0;
   trim.opt <- 0.25;

   # perform fcros()
   af <- fcros(fdata, cont, test, log2.opt, trim.opt);

   # perform Volcano plot
   fvalVolcanoPlot(af, thr = 0.01)

   # save fcros values in a file
   fcrosWrite(af, file = "test2delete_values.txt");

   # now select top 20 down and/or up regulated genes
   top20 <- fcrosTopN(af, 20);
   alpha1 <- top20$alpha[1];
   alpha2 <- top20$alpha[2];
   id.down  <- matrix(c(0,11), ncol = 1);
   id.up <- matrix(c(rep(0,11)), ncol = 1);
   n <- length(af$FC);
   f.value <- af$f.value;

   idown <- 1;
   iup <- 1;
   for (i in 1:n) {
       if (f.value[i] <= alpha1) { id.down[idown] <- i; idown <- idown+1; }
       if (f.value[i] >= alpha2) { id.up[iup] <- i; iup <- iup+1; }
   }

   data.down <- fdata[id.down[1:(idown-1)], ];
   ndown <- nrow(data.down);
   data.up <- fdata[id.up[1:(iup-1)], ];
   nup <- nrow(data.up);

   # now plot down regulated genes
   t <- 1:20;
   op = par(mfrow = c(2,1));
   plot(t, data.down[1,2:21], type = "l", col = "blue", xlim = c(1,20),
          ylim = c(0,18), main = "Top down-regulated genes");
   for (i in 2:ndown) {
       lines(t, data.down[i,2:21], type = "l", col = "blue")
   }

   # now plot down and up regulated genes
   plot(t, data.up[1,2:21], type = "l", col = "red", xlim = c(1,20),
       ylim = c(0,18), main = "Top up-regulated genes");
   for (i in 2:nup) {
       lines(t, data.up[i,2:21], type = "l", col = "red")
   }
   par(op)



