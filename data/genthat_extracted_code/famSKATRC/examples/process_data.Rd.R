library(famSKATRC)


### Name: process_data
### Title: Process Data
### Aliases: process_data
### Keywords: ~pedigree ~data

### ** Examples

sample.ped.geno <- process_data()
## The function is currently defined as
function(Data = read.table(system.file("extdata", "data",
                                                package = "famSKATRC"), header = TRUE))
{
  Data[ , "IID"] = paste(Data[ , "FID"]  , Data[ , "IID"]  ,sep=".")
  Data[Data[,"FA"]!=0 , "FA"] = paste(Data[Data[,"FA"]!=0 , "FID"], Data[Data[,"FA"]!=0,
                                                                        "FA"]  ,sep=".")
  Data[Data[,"FA"]!=0 , "MO"] = paste(Data[Data[,"FA"]!=0 , "FID"], Data[Data[,"FA"]!=0,
                                                                        "MO"]  ,sep=".")
  return(Data)
}



