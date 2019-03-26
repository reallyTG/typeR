library(fcros)


### Name: fdata
### Title: Example of dataset for the fcros package.
### Aliases: fdata
### Keywords: datasets

### ** Examples

   data(fdata)

   rownames(fdata) <- fdata[,1];

   op <- par(mfrow = c(2,1));

   #  perform MA plot using samples "cont01" and "cont05"
   A1 <- 0.5*(fdata$cont01 + fdata$cont05);
   M1 <- fdata$cont05 - fdata$cont01;

   plot(A1, M1, col="red", xlim=c(2,18), ylim=c(-5,5),
            main="MA plot with two control samples");
   lines(x = c(2,18), y = c(0,0), col = "blue")
   lines(x = c(2,18), y = c(-1,-1), col = "blue")
   lines(x = c(2,18), y = c(1,1), col = "blue")

   #  perform MA plot using samples "cont01" and "test05"
   A2 <- 0.5*(fdata$cont01 + fdata$test05);
   M2 <- fdata$test05 - fdata$cont01;

   plot(A2, M2, col="red", xlim=c(2,18), ylim=c(-5,5),
            main="MA plot with one control and one test samples");
   lines(x = c(2,18), y = c(0,0), col = "blue")
   lines(x = c(2,18), y = c(-1,-1), col = "blue")
   lines(x = c(2,18), y = c(1,1), col = "blue")
   par(op)



