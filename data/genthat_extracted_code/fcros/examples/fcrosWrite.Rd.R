library(fcros)


### Name: fcrosWrite
### Title: Writing the fcros() or pfco() results in a tab delimited text
###   file
### Aliases: fcrosWrite

### ** Examples

    data(fdata);

    rownames(fdata) <- fdata[,1];
    cont <- c("cont01", "cont07", "cont03", "cont04", "cont08");
    test <- c("test01", "test02", "test08", "test09", "test05");
    log2.opt <- 0;
    trim.opt <- 0.25;
    af <- fcros(fdata, cont, test, log2.opt, trim.opt);
    af2 <- pfco(fdata, cont, test, log2.opt, trim.opt);

    fcrosWrite(af, file = "test2delete_values.txt");
    fcrosWrite(af2, file = "test2delete2_values.txt");



