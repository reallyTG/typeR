library(raustats)


### Name: abs_metadata
### Title: Download updated data series information from the ABS API
### Aliases: abs_metadata

### ** Examples

  ## No test: 
    datasets <- abs_datasets();
    x <- abs_metadata("CPI");
    x <- abs_metadata(grep("cpi", datasets$id, ignore.case=TRUE, value=TRUE));
    names(x)
    y <- abs_metadata(datasets$id[1]);
    names(y)
  
## End(No test)



