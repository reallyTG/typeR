library(fcros)


### Name: fcrosRead
### Title: Read a tab delimited text file
### Aliases: fcrosRead

### ** Examples

  # generate random dataset of size 100 x 5
  xdata <- matrix(c(rep(0,600)), ncol = 6);

  xdata[,2:6] <- matrix(rnorm(500,0,1), ncol = 5);

  x0 <- matrix(NA, 100, 0);

  for (i in 1:100) {
      x0[i] <- paste("Obs_",i, sep = "");
  }

  # set column names
  colnames(xdata) <- c("Index", "Col_1", "Col_2", "Col_3", "Col_4", "Col_5");

  # save data in a text file
  write.table(xdata, file = "test2delete.txt", quote = FALSE, sep = "\t",
         eol = "\n", col.names = TRUE, row.names = FALSE);

  # now used fcros.read() to open the file
  mydata <- fcrosRead(file = "test2delete.txt");

  summary(mydata)



