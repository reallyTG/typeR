library(sweidnumbr)


### Name: pin_age
### Title: Calculate age of 'pin' for a given date
### Aliases: pin_age

### ** Examples

# Example with someone born today
today_pin <- 
  paste(paste(unlist(strsplit(as.character(Sys.Date()),split = "-")), collapse = ""),
        "0000",sep="")
pin_age(today_pin)

# Examples taken from SKV 704 (see references)
ex_pin <- c("196408233234", "186408833224")
pin_age(ex_pin, date = "2012-01-01")




