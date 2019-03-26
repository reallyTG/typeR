library(ledger)


### Name: register
### Title: Import a hledger or beancount register
### Aliases: register register_beancount register_hledger register_ledger

### ** Examples

 if (Sys.which("ledger") != "") {
     example_ledger_file <- system.file("extdata", "example.ledger", package = "ledger") 
     dfl <- register(example_ledger_file)
     head(dfl)
 }
 if (Sys.which("hledger") != "") {
     example_hledger_file <- system.file("extdata", "example.hledger", package = "ledger") 
     dfh <- register(example_hledger_file)
     head(dfh)
 }
 if (Sys.which("bean-query") != "") {
     example_beancount_file <- system.file("extdata", "example.beancount", package = "ledger") 
     dfb <- register(example_beancount_file)
     head(dfb)
 }



