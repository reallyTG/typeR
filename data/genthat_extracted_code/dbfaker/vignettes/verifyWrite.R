## ----eval=FALSE----------------------------------------------------------
#  
#  # parse cli arguments
#  library(optparse)
#  option_list <- list(
#    make_option(c("-d", "--date"),
#                type="character",
#                default=as.character(as_date(with_tz(Sys.time(), "GMT"))),
#                help="date of execution"),
#    make_option(c("-t", "--test"),
#                action="store_true",
#                default=FALSE,
#                help="execute tests and mask writes to databases")
#  )
#  opt <- parse_args(OptionParser(option_list=option_list))
#  
#  # execute with parsed arguments
#  run(opt$date, opt$test)
#  
#  # main function which encapsulates high level functions of your program
#  run <- function(date, test) {
#    readData(...)
#    transformData(...)
#    trainModel(...)
#    ifelse(test, dbfaker::verifyWrite(...), writeData(...))
#  }
#  
#  # components of your program
#  readData <- function(...) {}
#  transformData <- function(...) {}
#  trainModel <- function(...) {}
#  writeData <- function(...) {
#    dbWriteTable(...)
#    dbSendQuery(...)
#  }
#  

