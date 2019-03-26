library(TAQMNGR)


### Name: TAQ
### Title: TAQ Manager
### Aliases: TAQ.CleanTickByTick TAQ.Aggregate TAQ.Report TAQ.Read

### ** Examples

  #### A fake dataset for running the example can be downloaded at 
  #### 'http://local.disia.unifi.it/cipollini/webpage-new/data/data_sample.txt.gz' 
  ## Input
  # dirInput  <- "path of the input folder" 
  # dirOutput <- "path of the output folder" ## Must be different from 'dirInput' 
  ## Clean
  # TAQ.CleanTickByTick(dirInput = dirInput, dirOutput = dirInput)
  ## Make the report (1 at a time)
  # TAQ.Report(dirInput = dirOutput, symbol = c("DOG")) ## A scalar symbol
  # TAQ.Report(dirInput = dirOutput, symbol = c("GNU")) ## A scalar symbol
  ## Aggregate
  # TAQ.Aggregate(dirInput = dirOutput, symbol = c("DOG", "GNU"), bin = 300, 
  #   useAggregated = TRUE)
  ## Import data
  # dog <- TAQ.Read(dirInput = dirOutput, symbol = "DOG", 
  #   startDate = 00010101, endDate = 20141231, bin = 300)



