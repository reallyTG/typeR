library(fcros)


### Name: fcros2
### Title: Search for differentially expressed genes/probes
### Aliases: fcros2

### ** Examples

   data(fdata);

   rownames(fdata) <- fdata[,1];

   cont <- c("cont01", "cont02", "cont03", "cont04", "cont05",
             "cont06", "cont07", "cont08", "cont09", "cont10");
   test <- c("test01", "test02", "test03", "test04", "test05",
             "test06", "test07", "test08", "test09", "test10");
   log2.opt <- 0;
   trim.opt <- 0.25;

   # perform fcros2()
   xdata1 <- fdata[,c(2:5, 12:17)];
   xdata2 <- fdata[,c(6:11, 18:21)];
   rownames(xdata1) <- fdata[,1];
   rownames(xdata2) <- fdata[,1];

   af2 <- fcros2(xdata1, xdata2, cont, test, log2.opt, trim.opt);

   # now select top 20 down and/or up regulated genes
   top20 <- fcrosTopN(af2, 20);
   alpha1 <- top20$alpha[1];
   alpha2 <- top20$alpha[2];
   id.down  <- matrix(0,1);
   id.up <- matrix(0,1);
   n <- length(af2$FC);
   f.value <- af2$f.value;

   idown <- 1;
   iup <- 1;
   for (i in 1:n) {
       if (f.value[i] <= alpha1) { id.down[idown] <- i; idown <- idown + 1; }
       if (f.value[i] >= alpha2) { id.up[iup] <- i; iup <- iup + 1; }
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
       lines(t,data.down[i,2:21], type = "l", col = "blue")
   }

   # now plot down and up regulated genes
   plot(t, data.up[1,2:21], type = "l", col = "red", xlim = c(1,20),
       ylim = c(0,18), main = "Top up-regulated genes");
   for (i in 2:nup) {
       lines(t, data.up[i,2:21], type = "l", col = "red")
   }
   par(op)



